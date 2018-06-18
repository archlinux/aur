# Maintainer: Markus Unterwaditzer <markus-aur@unterwaditzer.net>

_name=shippai
pkgname=python-${_name}
pkgver=0.3.0
pkgrel=1
pkgdesc="Rust failures in other languages"
arch=('any')
url="https://github.com/untitaker/shippai"
license=('MIT')
depends=()
source=(${_name}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/08/08/b2ac300df2b575cdb50605527bd35454493cf0d24a09297b30835eff9317/shippai-0.3.0.tar.gz")
sha512sums=('bb55c731db5430e349c6a30e79a86d0692da03899352a7c62f2b76284d70ccf8377561007a19ad636025aaa3ea944cfca5468ffd5ceac81728ffec4b8caf0656')

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
