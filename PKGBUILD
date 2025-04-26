# Maintainer: meanlint <meanlint@outlook.com>
# Contributor: Robert Baker <reiichi001@gmail.com>
pkgname=xivlauncher-cn-bin
pkgver=1.1.2.5
pkgrel=1
pkgdesc="Custom Launcher for Final Fantasy XIV Online CN"
arch=('x86_64')
url='https://github.com/ottercorp/XIVLauncher.Core'
license=('GPL')
depends=(
    'aria2'
    'sdl2'
    'libsecret'
    'desktop-file-utils'
    'jxrlib'
)
options=('!strip')
provides=("xivlauncher=${pkgver}")
conflicts=("xivlauncher")
source=(
    "XIVLauncher.Core.tar.gz::https://github.com/ottercorp/XIVLauncher.Core/releases/download/${pkgver}/XIVLauncher.Core-arch.tar.gz"
    "512.png"
    "XIVLauncher.desktop"
    "xivlauncher-core"
)
sha512sums=(
    'SKIP'
    '0c33502cd915132151fa4b6c94899bf3f8806c2943469609cdda09365ff78be863215abd2741048d6c9a934a22dca0f8a8a2c67074c38abc6f67984c393859c4'
    '6c9a1f783969f293c07f06d167ab830f77ddaffdd8ce1df5f4e736056bd7c10c169c8c2411499493fb39659ca10643590998fccdaf4978dacb671ecfa2872949'
    'dad16da8e1d2bc772f7e1be1f59fd799c596fa88fb77a7e58a94baf10a1ca2f0ad7e79ad3baa8ba24e35dd0bc748884c74371c447816b1ea61098f58a130313a'
)

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/opt/XIVLauncher/"
    install -D -m644 "${srcdir}/XIVLauncher.desktop" "${pkgdir}/usr/share/applications/XIVLauncher.desktop"
    install -D -m644 "${srcdir}/512.png" "${pkgdir}/usr/share/pixmaps/xivlauncher.png"
    cp -r "${srcdir}/." "${pkgdir}/opt/XIVLauncher/"
    ln -s ../../opt/XIVLauncher/XIVLauncher.Core "${pkgdir}/usr/bin/XIVLauncher.Core"
    install -D -m755  "${srcdir}/xivlauncher-core" "${pkgdir}/usr/bin/xivlauncher-core"
}
