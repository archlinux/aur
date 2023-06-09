# Maintainer: fn2006 <usernamefn2006alreadyused@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: seth <getchoo at tuta dot io>

pkgname=pollymc-bin
pkgver=7.0
pkgrel=1
pkgdesc="Prism Launcher fork that adds Ely.by support and allows you to use offline mode without an account."
arch=('x86_64')
url="https://github.com/fn2006/PollyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('pollymc')
conflicts=('pollymc')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://github.com/fn2006/PollyMC/releases/download/${pkgver}/PollyMC-Linux-Qt6-${pkgver}.tar.gz")
noextract=("PollyMC-Linux-Qt6-${pkgver}.tar.gz")
sha256sums=('3bcb0e7a1806f1c264eec9685edf3c0182abfc4a030d7eb7d83c02c6ca3280ff')

package() {
    install -d "${pkgdir}/usr"
    tar -C "${pkgdir}/usr" -xvf PollyMC-Linux-Qt6-${pkgver}.tar.gz
    chown -R root:root "${pkgdir}/usr"  # files in tarball are not owned by root
}

