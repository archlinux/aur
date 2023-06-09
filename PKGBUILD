# Maintainer: fn2006 <usernamefn2006alreadyused@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: seth <getchoo at tuta dot io>

pkgname=pollymc-qt5-bin
pkgver=7.0
pkgrel=1
pkgdesc="Prism Launcher fork that adds Ely.by support and allows you to use offline mode without an account."
arch=('x86_64')
url="https://github.com/fn2006/PollyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('pollymc' 'pollymc-qt5')
conflicts=('pollymc' 'pollymc-qt5')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://github.com/fn2006/PollyMC/releases/download/${pkgver}/PollyMC-Linux-${pkgver}.tar.gz")
noextract=("PollyMC-Linux-${pkgver}.tar.gz")
sha256sums=('eb97388040bf11121784d11f0c6e2e23ff936a066df0dcbb535db8eae197b9fe')

package() {
    install -d "${pkgdir}/usr"
    tar -C "${pkgdir}/usr" -xvf PollyMC-Linux-${pkgver}.tar.gz
    chown -R root:root "${pkgdir}/usr"  # files in tarball are not owned by root
}

