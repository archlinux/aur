# Maintainer: fn2006 <usernamefn2006alreadyused@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <code@ihavea.quest>

pkgname=pollymc-bin
pkgver=5.1
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
sha256sums=('207f747683e5777c4af0b2b12dcf44f934df601c93a9d21141350e3c3b96f6f5')

package() {
    install -d "$pkgdir/usr"
    tar -C "$pkgdir/usr" -xvf PollyMC-Linux-Qt6-${pkgver}.tar.gz
    chown -R root:root "$pkgdir/usr"  # fils in tarball are not owned by root
}

