# Maintainer: Benedikt Rips <benedikt.rips@gmail.com>

pkgname=plymouth-theme-logo-spinner-git
pkgver=r1.bc5daf8
pkgrel=2
pkgdesc="A simple plymouth theme with a logo and a spinner"
arch=('any')
url="https://github.com/f1rstlady/plymouth-theme-logo-spinner"
license=('unknown')
depends=('plymouth')
makedepends=('git')
source=("git+https://github.com/f1rstlady/plymouth-theme-logo-spinner.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/plymouth-theme-logo-spinner"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd plymouth-theme-logo-spinner
    install -dm755 "$pkgdir/usr/share/plymouth/themes/logo-spinner"
    cp -r * "$pkgdir/usr/share/plymouth/themes/logo-spinner"
}
