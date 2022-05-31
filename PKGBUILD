# Maintainer: pkg_maintainer <archlinuxpackagemaintainer@gmail.com>
pkgname=neon-logout-git
pkgver=5.r14.dabf7a6
pkgrel=1
epoch=
pkgdesc="A logout window manager made for neon-os. inspired from distrotube. credit to flaticons for the icons"
arch=('x86_64')
url="https://www.gitlab.com/NEON-MMD/neon-logout.git"
license=('GPL3')
groups=()
depends=(slock qt5-3d qt5-base qt5-charts qt5-connectivity qt5-datavis3d qt5-declarative qt5-doc qt5-examples qt5-gamepad qt5-graphicaleffects qt5-imageformats qt5-location qt5-lottie qt5-multimedia qt5-networkauth qt5-purchasing qt5-quick3d qt5-quickcontrols qt5-quickcontrols2 qt5-quicktimeline qt5-remoteobjects qt5-script qt5-scxml qt5-sensors qt5-serialbus qt5-serialport qt5-speech qt5-svg qt5-tools qt5-translations qt5-virtualkeyboard qt5-wayland qt5-webchannel qt5-webengine qt5-webglplugin qt5-websockets qt5-webview qt5-x11extras qt5-xmlpatterns)

makedepends=(git)
checkdepends=()
optdepends=()
provides=(neon-logout-git)
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
    printf "5.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd neon-logout
    make
}

package() {
    cd neon-logout
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf *.png ${pkgdir}/opt/${pkgname}
    install -Dm755 neon-logout "${pkgdir}/usr/bin/neon-logout" 
    install -Dm644 README.org "${pkgdir}/usr/share/doc/${pkgname}/README.org"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

