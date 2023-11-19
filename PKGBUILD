# Maintainer: fn2006 <usernamefn2006alreadyused@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: seth <getchoo at tuta dot io>

pkgname=pollymc-qt5-bin
pkgver=8.0
pkgrel=2
pkgdesc="DRM-free Prism Launcher fork with support for custom auth servers."
arch=('x86_64')
url="https://github.com/fn2006/PollyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('pollymc' 'pollymc-qt5')
conflicts=('pollymc' 'pollymc-qt5' 'prismlauncher')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://github.com/fn2006/PollyMC/releases/download/${pkgver}/PollyMC-Linux-Qt5-${pkgver}.tar.gz")
noextract=("PollyMC-Linux-Qt5-${pkgver}.tar.gz")
sha256sums=('72e9ccb19dc39e3317f4bc850fe3491670d481a07920b1b3a547a7066d239a1c')

package() {
    install -d "${pkgdir}/usr"
    tar -C "${pkgdir}/usr" -xvf PollyMC-Linux-Qt5-${pkgver}.tar.gz
    rm "${pkgdir}"/usr/bin/pollymc_updater
    chown -R root:root "${pkgdir}/usr"  # files in tarball are not owned by root
}

