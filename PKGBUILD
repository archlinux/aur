# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app-bin
pkgver=0.6.3
pkgrel=1
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL3')
depends=(
    # tauri deps
    'openssl' 'dbus' 'freetype2' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsoup' 'webkit2gtk'
    # minecraft deps
    'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm'
)
optdepends=(
    'xorg-xrandr: for older minecraft versions'
)
provides=('modrinth-app')
conflicts=('modrinth-app' 'modrinth-app-git')
source=("https://launcher-files.modrinth.com/versions/${pkgver}/linux/modrinth-app_${pkgver}_amd64.deb")
sha256sums=('453e72dfaaff9e6f74224227bc2c0d5bb66ff4b424f747dffebb5e80f0449b2c')

build() {
    cd "$srcdir/"
    tar xf data.tar.gz
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}"
}
