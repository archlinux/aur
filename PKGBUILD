# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=python-pyusb
pkgver=1.0.0
pkgrel=2
pkgdesc='A pure Python module which provides USB access'
arch=('any')
url="https://github.com/walac/pyusb"
license=('custom')
depends=('python' 'libusb')
makedepends=('python-distribute')
provides=($pkgname)
conflicts=($pkgname-git)
source=("https://github.com/walac/pyusb/archive/${pkgver}.tar.gz")
sha256sums=('52106ce23ccc3b804335952aa48f7d5ce94f7ec27b44bb2d523eac92b97ace63')

build() {
  cd $srcdir/pyusb-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/pyusb-$pkgver
  python setup.py install -f --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
