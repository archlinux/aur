# Maintainer: Felix Bühler <account at buehler dot de>
# Maintainer: lvxnull <lvxnull at proton dot me>

pkgname=(nautilus-open-any-terminal caja-open-any-terminal)
_pkgname="${pkgname[0]}"
pkgver=0.8.0
pkgrel=1
pkgdesc="context-menu entry for opening other terminal in nautilus"
arch=(any)
url="https://github.com/Stunkymonkey/nautilus-open-any-terminal"
license=(GPL3)
makedepends=(make gettext)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c8262c66dc2d79c415df0542d94f7f0a7b4a1ce2267bf176c037bcbc76008eaa')

build() {
  cd "${_pkgname}-${pkgver}"

  make build
}

package_nautilus-open-any-terminal() {
    depends=(python-nautilus)
    cd "${_pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" PREFIX="/usr" install-nautilus
}

package_caja-open-any-terminal() {
    depends=(python-caja)
    cd "${_pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" PREFIX="/usr" install-caja
}
