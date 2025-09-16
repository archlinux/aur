# Maintainer: Duwangel <duwangelwj@pm.me>
# Contributor: Look <notkool@protonmail.com>
# Contributor: hyknn <hyknn@protonmail.com>
pkgname=hayase-desktop-bin
_pkgname=Hayase
pkgver=6.4.32
pkgrel=1
pkgdesc="Formerly Miru. Torrent streaming made simple. Watch anime torrents, real-time with no waiting for downloads (prebuilt binary), successor to miru-bin"
arch=('x86_64')
url="https://github.com/hayase-app/ui"
license=('BUSL-1.1')
depends=('xdg-utils')
provides=(
    "${pkgname%-desktop-bin}"
    'miru'
)
conflicts=("${pkgname%-desktop-bin}")
options=(
    '!strip'
    '!emptydirs'
    '!debug'
)
install=${pkgname}.install
source=(
    "${pkgname%-desktop-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/linux-${pkgname%-desktop-bin}-${pkgver}-linux.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/hayase-app/ui/v${pkgver}/LICENSE"
    "${pkgname}.install"
)
sha512sums=('d38dba0e7dff66918b889283bf1e9f9d794e7927ff5286c15edbf242957c89725ee848f7eed8a4852b39eb9a26887ea69c5c0f92cb783e14dbdef4492b26edab'
            '28eb0f95d44512e9b901dbcf6c75d9d1fd21d60728d0958f3936f7071a16d62b4999470462b637fc5ba4a35b5fe99838510289f8ba017255e0f13a8dad2e9f29'
            '67b9bf7da2fc891442b8bfd441a12203717c1f9e96ef94eae62c53138b4e4442b26da9ad4a41a40f79de5f5c93383e092db3629e249c9a04e3f24c415a6a1ba1')

package() {
    # Extract package data
    tar -xJ -f data.tar.xz -C "${pkgdir}"

    install -D -m644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
