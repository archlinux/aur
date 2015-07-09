# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jason Giangrande <jgiangrande@clarku.edu>

_pkgname=pyusb
pkgname=python2-pyusb
pkgver=0.4.3
pkgrel=7
pkgdesc="A native Python module written in C which provides USB access."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/pyusb/"
license=('custom')
depends=('python2' 'libusb-compat')
makedepends=('python2-distribute')
conflicts=($_pkgname=$pkgver)
provides=($_pkgname)
source=("http://downloads.sourceforge.net/project/${_pkgname}/PyUSB%200.x/$pkgver/${_pkgname}-$pkgver.tar.gz")
md5sums=('a1a43bc6407caccbc22073c56439aa06')

build() {
  cd $_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install -f --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
