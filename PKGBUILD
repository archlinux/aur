# Maintainer: Peter DeVita <peter at encavo dot net>

pkgname=sddm-theme-amadeus-git
pkgver=r21.d3fd323
pkgrel=1
pkgdesc="Amadeus theme for SDDM"
arch=('any')
url="https://github.com/Michal-Szczepaniak/sddm-theme-amadeus"
license=('DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE')
makedepends=(
	'git'
)
depends=(
	'sddm'
	'otf-takao'
	'qt5-graphicaleffects'
)
source=("${pkgname}::git+https://github.com/Michal-Szczepaniak/sddm-theme-amadeus.git")
sha256sums=('SKIP')
conflicts=('sddm-theme-amadeus')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/usr/share/sddm/themes"
  rsync -r "${srcdir}/${pkgname}/" --exclude=.git "${pkgdir}/usr/share/sddm/themes/amadeus/"
}

