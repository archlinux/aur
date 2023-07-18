# Maintainer: uriel <no public email for you>

_pkgname=quark-engine
pkgname=quark-engine
pkgver=23.6.1
pkgrel=1
pkgdesc='An Obfuscation-Neglect Android Malware Scoring System'
arch=('any')
license=('GPL')
url='https://github.com/quark-engine/quark-engine'
depends=('python' 'python-prettytable' 'python-androguard' 'python-tqdm' 'python-colorama' 'python-graphviz' 'python-prompt_toolkit' 'python-plotly' 'python-rzpipe' 'python-click')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3b0e840b11f132636a28ae955813afb7a1a1ed001801d980c4b1b70128a188d9')

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

