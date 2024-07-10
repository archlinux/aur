# Maintainer: Felix Bühler <account at buehler dot de>
# Maintainer: lvxnull <lvxnull at proton dot me>

pkgname=(nautilus-open-any-terminal caja-open-any-terminal)
_pkgname="${pkgname[0]}"
pkgver=0.6.0
pkgrel=3
pkgdesc="context-menu entry for opening other terminal in nautilus"
arch=(any)
url="https://github.com/Stunkymonkey/nautilus-open-any-terminal"
license=(GPL3)
makedepends=(make gettext)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('96a1cf9ebd24b3a0b33c70c37f6ab39b11e6d11dc374c9199e54a0b1f19e163a')

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
