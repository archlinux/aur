# Maintainer: Jun Yan <jerrysteve1101@gmail.com>

pkgname=fcitx5-inflex-themes-git
_gitname=fcitx5-inflex-themes
pkgver=r4.86d0a36
pkgrel=2
pkgdesc="An aesthetic, modern fcitx5 theme featuring sharp-edged rectangle design."
arch=('any')
url="https://github.com/sanweiya/fcitx5-inflex-themes"
license=('BSD-2-Clause')
depends=('fcitx5')
makedepends=('git')
provides=('fcitx5-inflex-themes')
source=("${_gitname}::git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$_gitname"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    
    install -dm755 "${pkgdir}"/usr/share/fcitx5/themes/
    find . -name "*inflex-*" -type d -exec cp -ar {} "${pkgdir}"/usr/share/fcitx5/themes/ \;
}
