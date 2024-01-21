# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Protesilaos Stavrou <info at protesilaos dot com>
pkgname=tempus-themes-konsole-git
pkgver=0.2.0.r11.g475b7bf
pkgrel=1
pkgdesc="Tempus themes for Konsole"
arch=('any')
url="https://protesilaos.com/tempus-themes"
license=('GPL-3.0-or-later')
depends=('konsole')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/protesilaos/tempus-themes-konsole.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/konsole"
  install -Dm644 *.colorscheme -t "$pkgdir/usr/share/konsole/"
}
