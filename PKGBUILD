# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=fcitx5-skin-adwaita-dark
pkgver=r9.1d45848
pkgrel=1
pkgdesc="An Fcitx5 dark theme mimics GNOME Adwaita-dark"
arch=(any)
makedepends=(git)
url="https://github.com/escape0707/fcitx5-adwaita-dark"
license=('AGPL3')
makedepends=(git)
source=("$pkgname::git+$url#commit=1d45848312368595f3eeb9c246f203ca7032cbdd")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  
  # no tags then use number of revisions since beginning of the history
  # https://wiki.archlinux.org/title/VCS_package_guidelines#The_pkgver()_function

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {

  cd $srcdir/$pkgname
  install -Dm644 highlight.png "$pkgdir"/usr/share/fcitx5/themes/adwaita-dark/highlight.png
  install -Dm644 no_highlight.png "$pkgdir"/usr/share/fcitx5/themes/adwaita-dark/no_highlight.png
  install -Dm644 panel.png "$pkgdir"/usr/share/fcitx5/themes/adwaita-dark/panel.png
  install -Dm644 arrow.png "$pkgdir"/usr/share/fcitx5/themes/adwaita-dark/arrow.png
  install -Dm644 radio.png "$pkgdir"/usr/share/fcitx5/themes/adwaita-dark/radio.png
  install -Dm644 theme.conf "$pkgdir"/usr/share/fcitx5/themes/adwaita-dark/theme.conf

  #install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
