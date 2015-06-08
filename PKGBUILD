# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdrnfofs
pkgver=0.8
pkgrel=1
pkgdesc="virtual Fuse-based file system that maps recordings from the Linux Video Disc Recorder (VDR) to *.nfo and *.mpg files"
arch=('any')
license=('BSD')
url="http://projects.vdr-developer.org/projects/vdrnfofs"
depends=('python2-fuse')
makedepends=('python2-setuptools')
source=("http://projects.vdr-developer.org/attachments/download/727/$pkgname-$pkgver.tar.gz")
md5sums=('90204ab468c5dd1f9efedbb83b81905c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/$pkgname/COPYRIGHT"
}
