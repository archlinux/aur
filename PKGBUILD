# Maintainer: Markus Unterwaditzer <markus-aur@unterwaditzer.net>

_name=shippai
pkgname=python-${_name}
pkgver=0.2.4
pkgrel=1
pkgdesc="Rust failures in other languages"
arch=('any')
url="https://github.com/untitaker/shippai"
license=('MIT')
depends=()
source=(${_name}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/de/16/7e9ae164d3cd88d855d5e2625d3e86955a3e4b58c6d09dddde7367736d47/shippai-0.2.4.tar.gz")
sha512sums=('eebd4a7253dbda3d86eb770479548805a1fe5b07c896a701ce0cb02a5311b16d270bfecb0c5da6041c1ef29cacb2826d7120dee39464b7682ee3a2c10d2c8f57')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  #install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
