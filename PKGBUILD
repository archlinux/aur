# Maintainer: flopsyan <aur@flopsyan.de>

pkgname=betterfetch-git
pkgver=1
pkgrel=1
pkgdesc='Print system information (alternative to fastfetch and neofetch)'
arch=(any)
url='https://github.com/flopsyan/betterfetch'
license=('Apache-2.0')
depends=('bash')
makedepends=('git')
provides=('betterfetch')
conflicts=('betterfetch')
source=('git+https://github.com/flopsyan/betterfetch.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"

    install -Dm755 betterfetch "$pkgdir/usr/bin/betterfetch"

    install -d "$pkgdir/usr/share/betterfetch/sources"
    install -Dm644 sources/* -t "$pkgdir/usr/share/betterfetch/sources/"
}