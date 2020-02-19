# Maintainer: Benjamin Chausse <benjamin@chausse.xyz>

pkgname=fff-ueberzug-git
pkgver=aaff747
pkgrel=1
pkgdesc="A simple file manager written in bash. This fork uses ueberzug instead of w3m-img"
arch=('any')
url="https://github.com/zeljkobekcic/fff"
license=('MIT')
depends=(
	'xdg-utils'
	'fbset'
	'python-ueberzug'
  'xdotool'
)
makedepends=('git')
optdepends=()
provides=('fff')
conflicts=(
	'fff'
	'python-ueberzug-git'
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/fff"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/fff"
  install -Dm755 fff "$pkgdir/usr/bin/fff"
  install -Dm644 fff.1 "$pkgdir/usr/share/man/man1/fff.1"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
