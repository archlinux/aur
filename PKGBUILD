# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=wireviz
_pkgname=WireViz
pkgver=0.3.2
pkgrel=1
pkgdesc='Easily document cables, wiring harnesses and connector pinouts'
arch=('any')
url='https://github.com/formatc1702/WireViz'
_url_pypi='https://pypi.org/project/wireviz'
license=('GPL3')
depends=('python-graphviz' 'python-pillow' 'python-pyaml')
makedepends=('git' 'python-setuptools')
source=("https://github.com/formatc1702/WireViz/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bd2af9b6357bb2324a0db4b4efad4182ac0ea62d8f57ea55ac477428ea45e652')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'docs/'*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -rfv 'examples' 'tutorial' "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
