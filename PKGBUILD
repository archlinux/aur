# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=beaker-ng-bin
_pkgname="${pkgname%-ng-bin}-browser"
pkgver=1.2.3
pkgrel=2
pkgdesc="An experimental peer-to-peer Web browser - Compiler optimized, community maintained fork."
arch=('x86_64')
url="https://github.com/Alex313031/beaker-ng"
_githuburl="https://github.com/Alex313031/beaker-ng"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
depends=('dbus' 'libxdamage' 'python-setuptools' 'mesa' 'libdrm' 'expat' 'lib32-gcc-libs' 'libxrandr' \
    'lib32-glibc' 'hicolor-icon-theme' 'nss' 'python' 'gtk3' 'libxext' 'alsa-lib' 'glibc' 'glib2' 'python-six' \
    'sh' 'gcc-libs' 'gdk-pixbuf2' 'libxkbcommon' 'libxfixes' 'pango' 'at-spi2-core' 'cairo' 'make' 'perl' \
    'libxcomposite' 'libx11' 'libxshmfence' 'libxcb' 'libcups' 'nspr')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Alex313031/beaker-ng/master/LICENSE")
sha256sums=('ccb8672acecf930b9784d34de2a10c2ada6086e6df87d8dc30475e9e40e9e577'
            'eb791f2db5b80ad689773f5a5087942dabc577d5a22b5f5618d9c19f82facc17')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}