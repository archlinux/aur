# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jason Giangrande <jgiangrande@clarku.edu>

_pkgname=pyusb
pkgname=python2-pyusb
pkgver=1.0.0
pkgrel=1
pkgdesc="A native Python module written in C which provides USB access."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/pyusb/"
license=('custom')
depends=('python2' 'libusb-compat')
makedepends=('python2-distribute')
conflicts=($_pkgname=$pkgver)
provides=($_pkgname)
source=("https://github.com/walac/pyusb/archive/${pkgver}.tar.gz")
sha256sums=('52106ce23ccc3b804335952aa48f7d5ce94f7ec27b44bb2d523eac92b97ace63')

build() {
  cd $_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install -f --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
