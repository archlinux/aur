# Maintainer: fn2006 <usernamefn2006alreadyused@protonmail.com>
# Contributor: Lenny McLennington <lenny@sneed.church>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=pollymc-qt5-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Fork of PolyMC that adds Ely.by support and allows you to use offline mode without an account."
arch=('x86_64')
url="https://github.com/fn2006/PollyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('pollymc' 'pollymc-qt5')
conflicts=('polymc' 'pollymc' 'pollymc-qt5')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://github.com/fn2006/PollyMC/releases/download/${pkgver}/PollyMC-Linux-${pkgver}.tar.gz")
noextract=("PollyMC-Linux-${pkgver}.tar.gz")
sha256sums=('fe7a5221f361e53562f75a1ba23963845a65d4eec7b46afc6507da158c2d041d')

package() {
    install -d "$pkgdir/usr"
    tar -C "$pkgdir/usr" -xvf PollyMC-Linux-${pkgver}.tar.gz
    chown -R root:root "$pkgdir/usr"  # fils in tarball are not owned by root
}
