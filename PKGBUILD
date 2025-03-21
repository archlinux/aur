# Maintainer: suzakuwcx <suzakuwcx@gmail.com>
pkgname=raylink
pkgver=8.0.4.9
pkgrel=1
pkgdesc="Remote desktop software"
arch=('x86_64')
url="https://www.raylink.live/"
license=('custom')
depends=(
  'libxext' 'libxcb' 'libx11' 'libxi' 'libxrender' 'freetype2' 'fontconfig' 'dbus'
  'glib2' 'libxkbcommon' 'libxcb' 'libsm' 'libice' 'gcc-libs' 'libxau' 'libxtst'
  'libxrandr' 'libxinerama' 'libxfixes'
)
source=("https://download.raylink.live/web2.0/RayLink/RayLink_${pkgver}.deb"
        "raylink")
sha256sums=('7b6b64c91746cfb5e06357d335fc1f8b26f9320396bba91a71a6bc038f343c15'
            '92ae584ea900015d7f8bf92214533742711e0a24aa2bd67a5291331aee023d9f')

build() {
    tar -Jxvf data.tar.xz
    tar -zxvf control.tar.gz
}

package() {
    cp --no-preserve=ownership -fR opt/ "${pkgdir}/opt/"
    install -Dm755 "${srcdir}/raylink" "${pkgdir}/usr/bin/raylink"
    install -Dm644 "${srcdir}/usr/share/applications/raylink.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
