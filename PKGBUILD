# Maintainer: Tom Hesse <contact@tomhesse.xyz>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Wouter Haffmans <wouter@simply-life.net>

pkgname=locale-en_de-git
pkgver=r8.8b172dd
pkgrel=1
pkgdesc="English language locale for Germany (en_DE)"
arch=(any)
url="https://github.com/leander-j/en_DE"
license=("")
depends=(glibc)
provides=("locale-en_de")
conflicts=("locale-en_de")
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/leander-j/en_DE.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm 0644 en_DE $pkgdir/usr/share/i18n/locales/en_DE
}
