# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

_name="mando"
pkgname="python-${_name}"
pkgver=0.7.0
pkgrel=1
pkgdesc="Python library which wraps the argparse module to help write flexible CLI applications"
arch=('any')
url="https://${_name}.readthedocs.org/"
# Repository: https://github.com/rubik/mando
license=('MIT')
depends=('python')
optdepends=('python-sphinx: to run unit tests')
makedepends=('python-rst2ansi' 'python-setuptools')
optdepends=('python-rst2ansi: restructuredText support')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('5306a91109096fe2e204a1f5ae141038842193f7210a7930c8ee73ccb7ecbf62'
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
