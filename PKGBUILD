pkgname=oneclient-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='Next-generation open source Minecraft launcher'
url='https://polyfrost.org/projects/oneclient'
arch=('x86_64')
license=('GPL-3.0-only')

depends=(
    'openssl' 'dbus' 'gtk3' 'libayatana-appindicator' 'librsvg' 'webkit2gtk-4.1'
    'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm'
)
optdepends=(
    'xorg-xrandr: very legacy minecraft versions'
)
provides=('oneclient')
conflicts=('oneclient')
source=("https://github.com/Polyfrost/OneLauncher/releases/download/oneclient-${pkgver}/oneclient_${pkgver}_amd64.deb")
sha256sums=('df5a0b5d8206679b5323788a542529ca95380d39f190fc7ba4f6effcdad182ae')

build() {
    cd "$srcdir/"
    tar xf data.tar.gz
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}"
}
