# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='linkfinder'
pkgname="${_pkgname}-git"
pkgver=r157.dae58bb
pkgrel=1
pkgdesc='Find endpoints in JavaScript files'
arch=('any')
url='https://github.com/GerbenJavado/LinkFinder'
license=('MIT')
depends=('python-argparse' 'python-jsbeautifier')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dvm755 "${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
