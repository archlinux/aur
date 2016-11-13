# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=papirus-icon-theme-kde
_commit=1bfe15f # 7 digits
pkgver=20161113
pkgrel=1
pkgdesc="Papirus icon theme for KDE"
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
arch=('any')
license=('GPL')
depends=('plasma-desktop')
makedepends=('git' 'make')
conflicts=('papirus-icon-theme-kde-git')
options=('!strip')
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    make -C "${pkgname}" install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 cc=80 et:
