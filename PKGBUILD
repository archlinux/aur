# Contributor: Thomas Quillan <tjquillan@gmail.com>
_pkgname=igdm
pkgname="${_pkgname}-bin"
pkgver=3.0.4
pkgrel=2
pkgdesc="Desktop application for Instagram DMs"
arch=('x86_64')
url="https://github.com/igdmapps/igdm"
license=(MIT)
depends=(at-spi2-core nss gtk3 alsa-lib libxrender libxcomposite libcups libxdamage nspr libxcursor gdk-pixbuf2 libxext \
    libx11 libxfixes hicolor-icon-theme glib2 cairo pango dbus gcc-libs libxtst glibc libxcb mesa expat libxrandr libxi libdrm)
provides=(igdmapps)
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/IGdm_${pkgver}_amd64.deb"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('c65181d96bc3886b77e37fe76d4a17626399ed3253a6353b78759fe0a1e40d99'
            'cf748db0da6198a8d7ab46140a63c8e2cb07e0eef2439deb191bdb7771266e7e')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}