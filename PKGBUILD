# Maintainer: A43 <arirera43 [at] gmail [dot] com>

_pkgname='neowofetch'
pkgname="$_pkgname-git"
license=('MIT')
pkgdesc="Standalone installation of hyfetch's neofetch fork, neowofetch"
pkgver=2.0.5.r2.g62b0fd9
pkgrel=1
url="https://github.com/hykilpikonna/hyfetch"
makedepends=('git')
depends=('bash')
arch=('any')
source=("git+https://github.com/hykilpikonna/hyfetch")
sha256sums=('SKIP')

pkgver() {
  cd "hyfetch"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -Dm755 "$srcdir/hyfetch/neofetch" "$pkgdir/usr/bin/neowofetch"
	install -Dm644 "$srcdir/hyfetch/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
