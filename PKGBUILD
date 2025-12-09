# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=archy-screenshot-git
_pkgname=archy-screenshot
pkgver=1.0.0
pkgrel=2
pkgdesc="Simple script helper to take screenshots with \`lqth\`"
arch=('any')
url="https://github.com/archy-linux/archy-screenshot"
license=('MIT')
groups=('archy-utils')
depends=('lqth-git' 'xrectsel' 'xdo' 'farbfeld')
optdepends=()
provides=('screenshot')
conflicts=("$_pkgname")
options=()
source=("$_pkgname::git+$url.git#branch=aurora")
sha256sums=(SKIP)
# validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$_pkgname"
    install -Dm755 screenshot.sh "$pkgdir/usr/bin/screenshot"
}
