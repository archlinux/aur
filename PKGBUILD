# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Protesilaos Stavrou <info at protesilaos dot com>
pkgname=tempus-themes-highlight-git
pkgver=r2.d08082e
pkgrel=1
pkgdesc="Tempus themes Highlight"
arch=('any')
url="https://protesilaos.com/tempus-themes"
license=('GPL-3.0-or-later')
depends=('highlight')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/protesilaos/tempus-themes-highlight.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/highlight/themes"
  install -Dm644 *.theme -t "$pkgdir/usr/share/highlight/themes/"
}
