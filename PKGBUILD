# Maintainer: Ayush Jha <ayushjha@pm.me>
pkgname=polybar-themes-git
pkgver=r2.689ca88
pkgrel=1
epoch=1
pkgdesc="A huge collection of polybar themes with different styles, colors and variants."
arch=('any')
url="https://github.com/adi1090x/polybar-themes"
license=('GPL3')
groups=()
depends=('polybar' 'rofi' 'python-pywal' 'calc' 'networkmanager-dmenu-git')
makedepends=('git')
source=(git+"${url}".git)
sha512sums=('SKIP')

pkgver() {
  cd polybar-themes
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd polybar-themes
  chmod +x setup.sh
}

package() {
  cd polybar-themes
  ./setup.sh
}