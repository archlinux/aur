# Contributor: Thomas Quillan <tjquillan@gmail.com>
pkgname="igdm-bin"
pkgver=3.0.4
pkgrel=3
pkgdesc="Desktop application for Instagram DMs"
arch=('x86_64')
url="https://github.com/igdmapps/igdm"
license=('MIT')
depends=('at-spi2-core' 'nss' 'gtk3' 'alsa-lib' 'libxrender' 'libxcomposite' 'libcups' 'libxdamage' \
    'nspr' 'libxcursor' 'gdk-pixbuf2' 'libxext' 'libx11' 'libxfixes' 'hicolor-icon-theme' 'glib2' 'cairo' \
    'pango' 'dbus' 'gcc-libs' 'libxtst' 'glibc' 'libxcb' 'mesa' 'expat' 'libxrandr' 'libxi' 'libdrm')
provides=()
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/IGdm_${pkgver}_amd64.deb"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('c65181d96bc3886b77e37fe76d4a17626399ed3253a6353b78759fe0a1e40d99'
            'cfe59b21a32217b32573315adbcc0f3621aeaa8dec634e54eb30a0cf260867cc')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}