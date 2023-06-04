# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aniflix-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Anime Streaming Desktop App"
arch=('x86_64')
url="https://aniflix.lamaau.space/"
_githuburl="https://github.com/rizkhal/aniflix"
license=('MIT')
depends=('nss' 'libxdamage' 'libxfixes' 'hicolor-icon-theme' 'libxcomposite' 'libxcb' 'libx11' 'libxext' 'expat' 'gtk3' 'at-spi2-core' \
    'libxrandr' 'libcups' 'glib2' 'glibc' 'dbus' 'libdrm' 'libxkbcommon' 'gcc-libs' 'nspr' 'mesa' 'pango' 'cairo' 'alsa-lib')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_0.1.0_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/rizkhal/aniflix/master/LICENSE")
noextract=("${pkgname%-bin}-${pkgver}.0-fedora.37.x86_64.rpm")
sha256sums=('db3c22d7f9d359852125fd5f3dc570fe540d3e10b2a172472cbf0c9df2b986da'
            'c3cc74287725f86a3a56a0e4d88895716ff81ff3c576ae69221feaa2539c0f86')
 
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}