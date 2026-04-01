pkgname=oneclient-bin
pkgver=1.1.3
pkgrel=1
pkgdesc='Next-generation open source Minecraft launcher that downloads all the mods you would ever want'
url='https://polyfrost.org/projects/oneclient'
arch=('x86_64')
license=('GPL-3.0-only')

depends=(
    'openssl' 'dbus' 'gtk3' 'libayatana-appindicator' 'librsvg' 'webkit2gtk-4.1'
    'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm'
)
provides=('oneclient')
conflicts=('oneclient')
source=("https://github.com/Polyfrost/OneLauncher/releases/download/oneclient-${pkgver}/oneclient_${pkgver}_amd64.deb")
sha256sums=('de2ba4dcfe58b3dfc20e13d5c96767348258a5cdde1bbee790927d0bd0f9838e')

build() {
    cd "$srcdir/"
    tar xf data.tar.gz
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}"
}
