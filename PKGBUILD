# Maintainer: Mao Kwen <maokwen@live.com>

pkgname=kvantum-theme-gruvbox-git
_gitname=Gruvbox-Kvantum
pkgver=r11.29ba1f0
pkgrel=2
pkgdesc="Gruvbox theme for Kvantum"
arch=(any)
url="https://github.com/TheGlitchh/${_gitname}"
depends=('kvantum')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=(
  "${pkgname%-git}"
  'gruvbox-kvantum-theme'
  'plasma5-themes-gruvbox'
  'gruvbox-kde-theme'
)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  install -d "$pkgdir/usr/share/Kvantum/Gruvbox"
  install -m644 gruvbox-kvantum/gruvbox-kvantum.kvconfig "$pkgdir/usr/share/Kvantum/Gruvbox/Gruvbox.kvconfig"
  install -m644 gruvbox-kvantum/gruvbox-kvantum.svg "$pkgdir/usr/share/Kvantum/Gruvbox/Gruvbox.svg"
}
