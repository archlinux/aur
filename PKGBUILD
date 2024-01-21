# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Protesilaos Stavrou <info at protesilaos dot com>
pkgname=tempus-themes-xfce4-terminal-git
pkgver=0.5.0.r12.gc58c907
pkgrel=1
pkgdesc="Tempus themes for Xfce4 Terminal"
arch=('any')
url="https://protesilaos.com/tempus-themes"
license=('GPL-3.0-or-later')
depends=('xfce4-terminal')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/protesilaos/tempus-themes-xfce4-terminal.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/xfce4/terminal/colorschemes"
  install -Dm644 *.theme -t "$pkgdir/usr/share/xfce4/terminal/colorschemes/"
}
