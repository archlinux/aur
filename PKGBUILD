# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=wireviz
_pkgname=WireViz
pkgver=0.4.1
_pkgversuffix=''
pkgrel=1
pkgdesc='Easily document cables, wiring harnesses and connector pinouts'
arch=('any')
url='https://github.com/formatc1702/WireViz'
license=('GPL-3.0')
depends=('python-graphviz' 'python-pillow' 'python-pyaml')
makedepends=('git' 'python-setuptools')
source=("https://github.com/formatc1702/WireViz/archive/refs/tags/v${pkgver}${_pkgversuffix}.tar.gz")
sha256sums=('ec32cc12a363bbbb7ee87960899de1a36fe32362e81e66541a5d56c750cd5680')

build() {
  cd "${_pkgname}-${pkgver}${_pkgversuffix}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}${_pkgversuffix}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'docs/'*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -rfv 'examples' 'tutorial' "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
