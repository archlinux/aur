# Maintainer: netcrusher < tobias AT miglix DOT eu >

_basename=renderdoc
pkgname=${_basename}-bin
pkgver=1.5
_tarname=${_basename}_${pkgver}
pkgrel=1
pkgdesc="OpenGL and Vulkan debugging tool - binary version"
arch=(x86_64)
url="https://github.com/baldurk/renderdoc"
license=('MIT')
conflicts=('renderdoc')
depends=("libgl" "libxcb" "libx11" "fontconfig" "freetype2" "libproxy" "python" "desktop-file-utils" "hicolor-icon-theme")
source=("https://renderdoc.org/stable/$pkgver/$_tarname.tar.gz"
        "https://renderdoc.org/stable/$pkgver/$_tarname.tar.gz.sig")
sha256sums=('974b3eabd8a3a1c76f48ce80bec858d0bc4caa14fe536fe12d779a0653d27aec'
            'SKIP')
validpgpkeys=('1B039DB9A4718A2D699DE031AC612C3120C34695')

package() {
    cd $_tarname
    install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/renderdoc-bin/LICENSE.md
    cp -rt $pkgdir etc
    cp -rt $pkgdir/usr bin lib share

    cd $pkgdir/usr
    find share/ -type f -exec chmod 644 {} \;
    find lib/ bin/ -type f -exec chmod 755 {} \;
}
