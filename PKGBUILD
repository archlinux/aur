# Maintainer: Felix Bühler <account at buehler dot de>
# Maintainer: lvxnull <lvxnull at proton dot me>

pkgname=(nautilus-open-any-terminal caja-open-any-terminal)
_pkgname="${pkgname[0]}"
pkgver=0.8.2
pkgrel=1
pkgdesc="context-menu entry for opening other terminal in nautilus"
arch=(any)
url="https://github.com/Stunkymonkey/nautilus-open-any-terminal"
license=(GPL3)
makedepends=(make gettext)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f7a48327947658c8d34879dbbc1081c40e726dc1cfd42a0191ef6a9d63faca71')

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
