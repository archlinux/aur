# Maintainer: Wouter Haffmans <wouter@simply-life.net>
pkgname=locale-en-nl-git
pkgver=r24.f98339c
pkgrel=1
pkgdesc="English language locale for the Netherlands (en_NL)"
arch=('any')
url="https://github.com/PanderMusubi/locale-en-nl"
license=('unknown')
groups=()
depends=(glibc)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=("$pkgname"::git+https://github.com/PanderMusubi/locale-en-nl.git#branch=master)
noextract=()
md5sums=('SKIP')
install=locale-en-nl-git.install

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  mkdir -p $pkgdir/usr/share/i18n/locales/
  install -m 0644 en_NL $pkgdir/usr/share/i18n/locales/en_NL
}
