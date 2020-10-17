# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='wireviz'
pkgver=0.2
pkgrel=1
pkgdesc='Easily document cables, wiring harnesses and connector pinouts'
arch=('any')
url='https://github.com/formatc1702/WireViz'
_url_pypi='https://pypi.org/project/wireviz'
license=('GPL3')
depends=('python-graphviz' 'python-pillow' 'python-pyaml')
makedepends=('git' 'python-setuptools')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  python setup.py build
}

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'docs/'*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -rfv 'examples' 'tutorial' "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
