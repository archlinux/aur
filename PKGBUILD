# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

_name="piqa"
pkgname=python-pytorch-${_name}
provides=("${pkgname}")
pkgver=1.1.7
pkgrel=1
pkgdesc="PyTorch Image Quality Assessment"
url="https://github.com/francois-rozet/${_name}"
license=('MIT')
arch=('x86_64')
depends=('python-pytorch')
makedepends=('python-setuptools')
source=("https://github.com/francois-rozet/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0b6f3249dbc20055ec17d4a7cfdca5830a61934ea5fc8b11f4223935099933b7')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

