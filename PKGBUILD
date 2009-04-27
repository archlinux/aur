# Contributor: Schnouki <thomas.jost@gmail.com>
pkgname=drobo-utils
pkgver=0.5.0
pkgrel=1
pkgdesc="A library, GUI and CLI script for managing Data Robotics storage units on Linux"
arch=(i686 x86_64)
url="http://drobo-utils.sourceforge.net/"
license=('GPL3')
depends=('python' 'pyqt' 'parted')
makedepends=()
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}_${pkgver}-1.tar.gz)
md5sums=('d4f2ad79afae1cbb6e5562c91f01caeb')

build() {
  cd "$srcdir/$pkgname-${pkgver//./_}"

  python setup.py install --prefix=$pkgdir/usr || return 1

  # Install some more stuff
  install -Dm644 drobom.8 $pkgdir/usr/share/man/man8/drobom.8 || return 1
  install -Dm644 droboview.8 $pkgdir/usr/share/man/man8/droboview.8 || return 1
  install -Dm644 README.txt $pkgdir/usr/share/doc/$pkgname/README.txt
}
