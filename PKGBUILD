# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Anthony25 <Anthony Ruhier>

pkgname='python2-selectors2'
_name="${pkgname#python2-}"
pkgver=2.0.2
pkgrel=2
pkgdesc='Backported, durable, and portable selectors (for Python 2)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
_tarname="${_name}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
sha256sums=('1f1bbaac203a23fbc851dc1b5a6e92c50698cc8cefa5873eb5b89eef53d1d82b')

build() {
  cd "${_tarname}"
  python2 setup.py build
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
