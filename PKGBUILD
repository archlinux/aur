# Maintainer: Klaus Mok <mokmail@web.de>

pkgname=locale-en_at-git
pkgver=r31.3541f07
pkgrel=1
pkgdesc="English language locale for Austria (en_AT)"
arch=(any)
url="https://gitlab.com/mokman/locale-en_at"
license=("GPL")
depends=(glibc)
makedepends=(git)
provides=("locale-en_at")
conflicts=("locale-en_at")
install=${pkgname}.install
source=("${pkgname}::git+https://gitlab.com/mokman/locale-en_at")
sha512sums=('SKIP')


pkgver() {
    cd "$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    install -Dm 0644 en_AT $pkgdir/usr/share/i18n/locales/en_AT
}

