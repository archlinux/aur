# Maintainer: ReadyPlayerNaN (https://github.com/ReadyPlayerNaN)
pkgname=ravel-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Read-only JSON, JSON Lines, YAML and Markdown viewer for GNOME (release binary)'
arch=('x86_64')
url='https://github.com/ReadyPlayerNaN/ravel'
license=('LicenseRef-unknown')
depends=('glibc' 'gcc-libs' 'gtk4>=4.12' 'libadwaita>=1.6' 'gtksourceview5>=5.4'
         'webkitgtk-6.0' 'gst-plugins-base' 'gst-plugins-good')
optdepends=('jq: run structural queries from the context menu'
            'gst-libav: additional audio and video codecs'
            'gst-plugins-bad: additional media formats'
            'gst-plugins-ugly: additional media codecs')
provides=("ravel=$pkgver")
conflicts=('ravel' 'ravel-git')
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v0.1.0/ravel-v0.1.0-linux-x86_64.tar.gz")
sha256sums_x86_64=('9750b61883c7201c39b694c948bf017ba2952b10b557c1acf4b41a618584876c')

package() {
    install -Dm755 "$srcdir/bin/ravel" "$pkgdir/usr/bin/ravel"
    install -Dm644 "$srcdir/share/applications/io.github.ravel.Ravel.desktop" \
        "$pkgdir/usr/share/applications/io.github.ravel.Ravel.desktop"
    install -Dm644 "$srcdir/share/doc/ravel/README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/share/licenses/ravel/KaTeX-LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/KaTeX-LICENSE"
}
