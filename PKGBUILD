# Maintainer: Benedikt Rips <benedikt.rips@gmail.com>

pkgname=refind-theme-simple-git
pkgver=r1.407eb6a
pkgrel=2
pkgdesc="A simple theme for the rEFInd boot manager"
arch=('any')
url="https://github.com/f1rstlady/refind-theme-simple"
license=('unknown')
depends=('refind')
makedepends=('git')
source=("git+https://github.com/f1rstlady/refind-theme-simple.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/refind-theme-simple"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd refind-theme-simple
    install -dm755 "$pkgdir/usr/share/refind/theme/simple"
    cp -r * "$pkgdir/usr/share/refind/theme/simple"
}
