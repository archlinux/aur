# Maintainer: dobragab <dobragab@gmail.com>

pkgname='cinnxp-icon-theme-git'
pkgver=r13.8edf942
pkgrel=1
pkgdesc='Remake of classic YlmfOS theme with some mods for icons to scale right.'
arch=('any')
url='https://github.com/Elbullazul/WinXP-Icons'
depends=('gtk-update-icon-cache')
makedepends=('git')
provides=('cinnxp-icon-theme-git')
conflicts=('cinnxp-icon-theme-git')
source=("${pkgname}::git+https://github.com/Elbullazul/WinXP-Icons.git")
md5sums=(SKIP)
_themename="WinXP-Icons"
_themedir="usr/share/icons/${_themename}"

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  install -dm755 "$pkgdir/$_themedir"
  cp -drf --no-preserve='ownership' . "$pkgdir/$_themedir/"
}
