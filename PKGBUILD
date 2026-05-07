# Maintainer: Popolon <popolon At popolon dot org>
# Contributor: Rafael Silva <perigoso@riseup.net>

_modulename='sphinxcontrib.asciinema'
pkgname="python-${_modulename/./-}"
pkgver=0.4.3
pkgrel=1
pkgdesc='Embed asciinema casts in your Sphinx docs.'
arch=('any')
url="https://github.com/divi255/sphinxcontrib.asciinema"
license=('MIT')
depends=(
  'python-sphinx'
)
makedepends=(
  'python-setuptools'
)
source=("https://github.com/divi255/${_modulename}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('0776967b3131dc967eaaa1e11bf20141c2b658a358124767c9baf7cec6294e9779959f6c08dfa435cee8a20962964885355f146d2ce327ffdb6fa4c6f6c63c16')

build() {
  cd "${_modulename}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_modulename}-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
