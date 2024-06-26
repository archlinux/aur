# Maintainer: Evan Goode <mail@evangoo.de>

pkgname=fjordlauncher-bin
pkgver=8.4
pkgrel=2
pkgdesc="Prism Launcher fork with support for alternative auth servers"
arch=('x86_64')
url="https://github.com/unmojang/FjordLauncher"
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND BSD-2-Clause AND BSD-3-Clause AND LicenseRef-Batch AND OFL-1.1')
depends=('java-runtime=17' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('fjordlauncher')
conflicts=('fjordlauncher')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'java-runtime=8: support for Minecraft versions < 1.17'
            'flite: minecraft voice narration'
)
source=("https://github.com/unmojang/FjordLauncher/releases/download/${pkgver}/FjordLauncher-Linux-Qt6-${pkgver}.tar.gz")
noextract=("FjordLauncher-Linux-Qt6-${pkgver}.tar.gz")
sha256sums=('cfa1d56cb5f09a5971937d81668a16629ebdc8460b1dd360335541e7deb13cef')

package() {
    install -d "${pkgdir}/usr"
    tar -C "${pkgdir}/usr" -xvf FjordLauncher-Linux-Qt6-${pkgver}.tar.gz
    rm "${pkgdir}"/usr/manifest.txt
    mv "${pkgdir}/usr/share/mime/packages/modrinth-mrpack-mime.xml" \
       "${pkgdir}/usr/share/mime/packages/fjordlauncher-modrinth-mrpack-mime.xml"
    chown -R root:root "${pkgdir}/usr"  # files in tarball are not owned by root
}
