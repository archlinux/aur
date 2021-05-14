# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

_name="piqa"
pkgname=python-pytorch-${_name}
provides=("${pkgname}")
pkgver=1.1.3
pkgrel=1
pkgdesc="PyTorch Image Quality Assessment"
url="https://github.com/francois-rozet/${_name}"
license=('MIT')
arch=('x86_64')
depends=('python-pytorch')
makedepends=('python-setuptools')
source=("https://github.com/francois-rozet/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('865fdb53eb544694d08697ccad1257ae21aa0a11b796980cabbf46aa9342df12')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

