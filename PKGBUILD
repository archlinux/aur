# Maintainer: Ali Pakrooh (pakrohk) <pakrohk@gmail.com>

_pkgname=aether-gui
_upstream_name=Aether-GUI
pkgname="${_pkgname}-bin"
pkgver=0.8.0
pkgrel=1
pkgdesc="One-click desktop GUI for the Aether censorship-circumvention tunnel (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/MatinSenPai/${_upstream_name}"
license=('AGPL-3.0-only')
depends=(
    'cairo'
    'desktop-file-utils'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'libsoup3'
    'openssl'
    'pango'
    'webkit2gtk-4.1'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source_x86_64=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_upstream_name}_${pkgver}_amd64.deb")
sha256sums_x86_64=('b613f12d39c1e03024620db2ab20c0bebca0c28d50d46287b762a227e52356f4')

package() {
    # Extract application data from the Debian archive into pkgdir
    bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}/"

    # Ensure standard directory permissions
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
