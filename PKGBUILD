# Maintainer: Mikhail Velichko <efklid@gmail.com>
# Contributor: Lolka Team <support@lolka.app>

pkgname=lolka-x-bin
pkgver=2.0.6
pkgrel=1
pkgdesc='Lolka X - chat, voice and screen sharing desktop client'
arch=('x86_64')
url='https://lolka.app'
license=('LicenseRef-LolkaX')
# Qt and FFmpeg are bundled; list only external runtime requirements here.
depends=(
    'glibc' 'gcc-libs' 'glib2' 'dbus' 'gtk3'
    'fontconfig' 'freetype2' 'krb5' 'zlib'
    'libglvnd' 'mesa' 'libpulse'
    'libx11' 'libxi' 'libxext' 'libxtst'
    'libxkbcommon' 'libxkbcommon-x11'
    'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm'
    'openssl' 'xdg-utils'
)
provides=('lolka-x' 'lolka' 'lolka-bin')
conflicts=('lolka-x' 'lolka' 'lolka-bin')
# Preserve upstream's prebuilt libraries and avoid generating a debug package.
options=('!strip' '!debug')

source=("lolka-x-${pkgver}-${arch[0]}.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/${pkgver}/${pkgname}-${pkgver}-1-${arch[0]}.pkg.tar.zst")
noextract=("lolka-x-${pkgver}-${arch[0]}.pkg.tar.zst")
sha512sums=('543222ae4ea5b40270b4bd3d6449a45294d2f949ddad301a115df8eb0194ca4fa18b45444a78a7126cf6ed37b74cad6b0996e50483290f90bad4b399be07d813')

package() {
    bsdtar -xf "$srcdir/lolka-x-${pkgver}-${arch[0]}.pkg.tar.zst" -C "$pkgdir" \
        --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' \
        --exclude='.INSTALL' --exclude='.CHANGELOG'
}
