# Maintainer: suzakuwcx <suzakuwcx@gmail.com>
pkgname=raylink
pkgver=8.0.4.8
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
source=("https://download.raylink.live/web2.0/RayLink/Linux/RayLink_${pkgver}.deb"
        "raylink")
sha256sums=('8c569935277187c0bcc3ba5c7645780bed13164bc67dc163ba55dd1b94f6399f'
            '92ae584ea900015d7f8bf92214533742711e0a24aa2bd67a5291331aee023d9f')

build() {
    tar -Jxvf data.tar.xz
    tar -zxvf control.tar.gz
}

package() {
    cp --no-preserve=ownership -fR opt/ "${pkgdir}/opt/"
    install -Dm755 raylink "${pkgdir}/usr/bin/raylink"
    install -Dm644 "usr/share/applications/raylink.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
