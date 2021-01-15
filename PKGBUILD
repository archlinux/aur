# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdrnfofs
pkgver=0.10.0
pkgrel=1
pkgdesc="virtual Fuse-based file system that maps recordings from the Linux Video Disc Recorder (VDR) to *.nfo and *.mpg files"
arch=('any')
license=('BSD')
url="https://github.com/M-Reimer/vdrnfofs"
depends=('python-fuse')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/M-Reimer/vdrnfofs/archive/$pkgver.tar.gz")
sha256sums=('2483a51a251d1e6b13627412b563a9242016ae242d0f883616aed7d4ccfd050a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/$pkgname/COPYRIGHT"
}
