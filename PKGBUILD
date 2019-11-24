# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

_name="mando"
pkgname="python-${_name}"
pkgver=0.6.4
pkgrel=2
pkgdesc="Python library which wraps the argparse module to help write flexible CLI applications"
arch=('any')
url="https://${_name}.readthedocs.org/"
# Repository: https://github.com/rubik/mando
license=('MIT')
depends=('python')
optdepends=('python-sphinx: to run unit tests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('79feb19dc0f097daa64a1243db578e7674909b75f88ac2220f1c065c10a0d960'
            '6123bc92c70372634b45af73fbae39eaa70683a66782b73b833c258c4de939eb')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package_python-mando() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
