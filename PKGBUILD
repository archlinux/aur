# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Protesilaos Stavrou <info at protesilaos dot com>
pkgname=tempus-themes-gtksourceview3-git
pkgver=0.4.0.r16.gd4f58c5
pkgrel=1
pkgdesc="Tempus themes for GTK3 syntax highlighting"
arch=('any')
url="https://protesilaos.com/tempus-themes"
license=('GPL-3.0-or-later')
depends=('gtksourceview3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/protesilaos/tempus-themes-gtksourceview3.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/gtksourceview-3.0/styles"
  install -Dm644 *.xml -t "$pkgdir/usr/share/gtksourceview-3.0/styles/"
}
