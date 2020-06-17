# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Wouter Haffmans <wouter@simply-life.net>

pkgname=locale-en_de-git
pkgver=r27.95f26de
pkgrel=1
pkgdesc="English language locale for Germany (en_DE)"
arch=(any)
url="https://gitlab.com/Scrumplex/locale-en_de"
license=("GPL")
depends=(glibc)
provides=("locale-en_de")
conflicts=("locale-en_de")
install=${pkgname}.install
source=("${pkgname}::git+https://gitlab.com/Scrumplex/locale-en_de")
sha512sums=('SKIP')


pkgver() {
    cd "$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    install -Dm 0644 en_DE $pkgdir/usr/share/i18n/locales/en_DE
}

