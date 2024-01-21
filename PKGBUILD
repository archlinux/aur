# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Protesilaos Stavrou <info at protesilaos dot com>
pkgname=tempus-themes-alacritty-git
pkgver=r1.199e862
pkgrel=1
pkgdesc="Tempus themes for Alacritty"
arch=('any')
url="https://protesilaos.com/tempus-themes"
license=('GPL-3.0-or-later')
depends=('alacritty')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/protesilaos/tempus-themes-alacritty.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -Dm644 alacritty/*.yml "$pkgdir/usr/share/alacritty/"
}
