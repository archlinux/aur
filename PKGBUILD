# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=dataprep
pkgname=python-${_base}
pkgver=0.4.5
pkgrel=1
pkgdesc="A low code data preparation library in python."
arch=('any')
url="https://github.com/sfu-db/${_base}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-nose' 'python-jsonschema')
source=(https://files.pythonhosted.org/packages/py3/${_base::1}/$_base/${_base//-/_}-$pkgver-py3-none-any.whl
        https://raw.githubusercontent.com/sfu-db/dataprep/master/LICENSE)
sha512sums=('ce7eaaacf376d4d5044dfac83fef371ddf831349a2469d83732f4b6665bfa6a4f48f64e46ed6ccf1fe28dd5d428b12051a74e617045bc0d67722d97e2e74dec6'
            '0aafa9562a7846461c3c3a3ac5bad9db713d1ed86a781d086e6a55d1e846e43741f306c001ddbaae87d350ab18cc5fcc39579b9b9d46d0b21c3781e5dc9a84b8')

#build() {
#  cd "${_base}-${pkgver}"
#  python -m build --wheel --no-isolation
#}

package() {
#  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" ${_base}-${pkgver}-py3-none-any.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
