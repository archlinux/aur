# Contributor: Christopher Arndt <chris@chrisarndt.de>
# Contributor: fsckd <fsckdaemon@gmail.com>
# Contributor: Kniyl <mathias.ettinger@gmail.com>
# Contributor: numeral <numerical@gmail.com>

pkgname=python-bleach
pkgver=1.5.0
pkgrel=1
pkgdesc="An easy whitelist-based HTML-sanitizing tool"
arch=('any')
license=('Apache')
url="http://pypi.python.org/pypi/bleach"
depends=('python-html5lib')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/99/00/25a8fce4de102bf6e3cc76bc4ea60685b2fee33bde1b34830c70cacc26a7/bleach-${pkgver}.tar.gz")
sha256sums=('978e758599b54cd3caa2e160d74102879b230ea8dc93871d0783721eef58bc65')

build() {
  cd "${srcdir}/bleach-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/bleach-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
