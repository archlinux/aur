# Maintainer: planktonzp <ruizhipeng001@gmail.com>

_pkgname=rose-pine-ironbar
pkgname=${_pkgname}-git
pkgver=r1.5c8359d
pkgrel=1
pkgdesc='Rosé Pine theme for ironbar'
arch=('any')
url='https://github.com/planktonzp/ironbar'
license=('MIT')
depends=('ironbar')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/ironbar/themes" \
    theme/rose-pine.css \
    theme/rose-pine-moon.css \
    theme/rose-pine-dawn.css

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
