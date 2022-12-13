# Maintainer: fn2006 <usernamefn2006alreadyused@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <code@ihavea.quest>

pkgname=pollymc-bin
pkgver=6.0
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
sha256sums=('18c60155c6a4d1cd980f255d357d5fc3fa79a55a4cda87206b1cd49616da2230')

package() {
    install -d "$pkgdir/usr"
    tar -C "$pkgdir/usr" -xvf PollyMC-Linux-Qt6-${pkgver}.tar.gz
    chown -R root:root "$pkgdir/usr"  # fils in tarball are not owned by root
}

