# Maintainer: Konstantin Gizdov <arch at kge dot pw>
_pkgname=j2cli
pkgname=python-${_pkgname}
pkgver=0.3.12b
pkgrel=3
pkgdesc="Command-line interface to Jinja2 for templating in shell scripts."
url="https://github.com/kolypto/j2cli"
license=("BSD")
arch=('any')
depends=('python' 'python-jinja' 'python-pyaml')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kolypto/j2cli/archive/v${pkgver}.tar.gz")
sha256sums=('5313700543db9a73bdc4a8634457870d0b49e1c83aae461974134c56405773cd')

build () {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

check () {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py test
}

package () {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
