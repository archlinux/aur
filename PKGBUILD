# Maintainer: AugustLigh <https://github.com/AugustLigh>
pkgname=llauncher-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Native Linux launcher for Arknights: Endfield"
arch=('x86_64')
url="https://github.com/AugustLigh/LLauncher"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'glib-networking' 'libayatana-appindicator' 'hicolor-icon-theme')
optdepends=('gamemode: CPU governor optimizations while gaming'
            'mangohud: FPS / frametime overlay'
            'gamescope: micro-compositor with FSR upscaling, FPS cap and HDR')
provides=('llauncher')
conflicts=('llauncher')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/LLauncher_${pkgver}_amd64.deb")
sha256sums=('93dd1d257a9eb5a1f8d6ba97c52956b336262e6fc1dea86c8cd84b252a9f376e')
noextract=("${pkgname}-${pkgver}.deb")

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" -C "${srcdir}" data.tar.gz
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
