# Maintainer: KirottuM <kirottualt@gmail.com>

pkgname=arch-wiki-dmenu-git
_pkgname=arch-wiki-dmenu
pkgver=r1.9e43f41
pkgrel=1
pkgdesc="Search ArchWiki offline docs with dmenu"
url="https://github.com/Kirottu/arch-wiki-dmenu"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('git')
provides=("$_pkgname")
depends=('arch-wiki-docs')
optdepends=('xdg-utils' 'fuzzel' 'dmenu' 'rofi' 'surf-git')
conflicts=("$_pkgname")
source=("git+https://github.com/Kirottu/arch-wiki-dmenu")
sha256sums=('SKIP')

pkgver() { 
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -D -Dm755 "$_pkgname"/arch-wiki-dmenu "$pkgdir"/usr/bin/arch-wiki-dmenu
}

