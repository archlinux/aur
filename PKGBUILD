pkgname=oneclient-bin
pkgver=1.1.5
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
sha256sums=('eb131c7277645a2f6f656a66ce9ac36715ef70cc5f64c48f0242c86efa57dfe6')

build() {
    cd "$srcdir/"
    tar xf data.tar.gz
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}"
}
