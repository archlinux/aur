# Maintainer: Jun Yan <jerrysteve1101@gmail.com>

pkgname=fcitx5-mellow-themes-git
_gitname=fcitx5-mellow-themes
pkgver=r24.9694953
pkgrel=1
pkgdesc="An aesthetic, modern fcitx5 theme featuring rounded rectangle design"
arch=('any')
url="https://github.com/sanweiya/fcitx5-mellow-themes"
license=('BSD-2-Clause')
depends=('fcitx5')
makedepends=('git')
provides=('fcitx5-mellow-themes')
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
    find . -name "*mellow-*" -type d -exec cp -ar {} "${pkgdir}"/usr/share/fcitx5/themes/ \;
}
