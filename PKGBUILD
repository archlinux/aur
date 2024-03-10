# Maintainer: meanlint <meanlint@outlook.com>
pkgname=xivlauncher-cn-bin
pkgver=1.0.7.0
pkgrel=1
pkgdesc="Custom Launcher for Final Fantasy XIV Online CN"
arch=('x86_64')
url='https://github.com/ottercorp/XIVLauncher.Core'
license=('GPL')
depends=(
    'aria2'
    'sdl2' 'lib32-sdl2'
    'libsecret'
    'attr'                  'lib32-attr'
    'fontconfig'            'lib32-fontconfig'
    'lcms2'                 'lib32-lcms2'
    'libxml2'               'lib32-libxml2'
    'libxcursor'            'lib32-libxcursor'
    'libxrandr'             'lib32-libxrandr'
    'libxdamage'            'lib32-libxdamage'
    'libxi'                 'lib32-libxi'
    'gettext'               'lib32-gettext'
    'freetype2'             'lib32-freetype2'
    'glu'                   'lib32-glu'
    'libsm'                 'lib32-libsm'
    'gcc-libs'              'lib32-gcc-libs'
    'libpcap'               'lib32-libpcap'
    'faudio'                'lib32-faudio'
    'desktop-file-utils'    'jxrlib'
)
options=('!strip')
provides=("xivlauncher=${pkgver}")
conflicts=("xivlauncher")
source=(
    "https://github.com/ottercorp/XIVLauncher.Core/releases/download/${pkgver}/XIVLauncher.Core-arch.tar.gz"
    "512.png"
    "XIVLauncher.desktop"
)
sha512sums=(
    'SKIP'
    '0c33502cd915132151fa4b6c94899bf3f8806c2943469609cdda09365ff78be863215abd2741048d6c9a934a22dca0f8a8a2c67074c38abc6f67984c393859c4'
    '6c9a1f783969f293c07f06d167ab830f77ddaffdd8ce1df5f4e736056bd7c10c169c8c2411499493fb39659ca10643590998fccdaf4978dacb671ecfa2872949'
)

package() {
    mkdir "XIVLauncher"
    tar -xf "XIVLauncher.Core-arch.tar.gz" -C "XIVLauncher"
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/opt/XIVLauncher/"
    install -D -m644 "${srcdir}/XIVLauncher.desktop" "${pkgdir}/usr/share/applications/XIVLauncher.desktop"
    install -D -m644 "${srcdir}/512.png" "${pkgdir}/usr/share/pixmaps/xivlauncher.png"
    cp -r "${srcdir}/XIVLauncher/." "${pkgdir}/opt/XIVLauncher/"
    ln -s ../../opt/XIVLauncher/XIVLauncher.Core "${pkgdir}/usr/bin/XIVLauncher.Core"
}
