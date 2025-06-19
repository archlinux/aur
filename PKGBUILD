# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: LordDemecrius83 <lorddemecrius83@proton.me>
# Contributor: sQVe <oskargrunning@gmail.com>
pkgname=vimix-gtk-themes-git
pkgver=2025.06.20.r0.gb86cf48
pkgrel=1
pkgdesc="A flat Material Design theme for GTK 3, GTK 2, GNOME Shell, etc."
arch=('any')
url="https://vinceliuice.github.io/theme-vimix.html"
license=('GPL-3.0-or-later')
makedepends=('git' 'sassc')
optdepends=(
  'gtk-engine-murrine: GTK2 theme support'
  'gtk-engines: GTK2 theme support'
  'kvantum-theme-vimix: Matching Kvantum theme'
  'vimix-icon-theme: Matching icon theme'
  'vimix-cursors: Matching cursor theme'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
install="${pkgname%-git}.install"
source=('git+https://github.com/vinceliuice/vimix-gtk-themes.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s all -d "$pkgdir/usr/share/themes"
}
