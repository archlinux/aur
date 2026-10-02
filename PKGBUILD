pkgname=nuvio-desktop-bin
_tag=0.1.26-alpha
pkgver=0.1.26.alpha
pkgrel=1
pkgdesc='Desktop media app for browsing, organizing and playing media from sources you add'
arch=('x86_64')
url='https://github.com/NuvioMedia/NuvioDesktop'
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'glib-networking' 'gst-libav'
         'gst-plugins-good' 'libx11' 'libxcomposite' 'libxext' 'libxi'
         'libxrender' 'libxtst' 'mpv' 'webkit2gtk-4.1' 'xdg-utils' 'zlib')
provides=('nuvio')
conflicts=('nuvio')
options=('!strip')
source=("nuvio-${_tag}.deb::${url}/releases/download/${_tag}/Nuvio-Linux-x86_64-${_tag}.deb")
sha256sums=('f7b24df4ef344e4a5971e632647610a8d7448114e29dc381b946b3fafea86c3e')

package() {
    bsdtar -xf data.tar.zst -C "$pkgdir"
    install -d "$pkgdir/usr/bin"
    ln -s /opt/nuvio/bin/Nuvio "$pkgdir/usr/bin/nuvio"
    install -Dm644 "$pkgdir/opt/nuvio/share/doc/copyright" "$pkgdir/usr/share/licenses/$pkgname/copyright"
}
