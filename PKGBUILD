# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app-bin
pkgver=0.6.1
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
sha256sums=('9a10f1b58be819e9b65bd650a8211e489fe75464e29880d39825e21405e9e7c4')

build() {
    cd "$srcdir/"
    tar xf data.tar.gz
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}"
}
