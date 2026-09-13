# Maintainer: Timothée Andres <andres.timothee+aur@gmail.com>
# Contributor: Nikoloz Shvelidze <shveloo@gmail.com>
pkgname=chronicler-bin
pkgver=0.60.1_alpha
pkgrel=1
pkgdesc="The free offline worldbuilding tool for writers and GMs."
arch=('x86_64')
license=('LicenseRef-PolyForm-Shield-1.0.0')
depends=('webkit2gtk-4.1' 'gtk3' 'gdk-pixbuf2' 'libgcc' 'libsoup3' 'hicolor-icon-theme' 'glibc' 'glib2' 'dbus' 'cairo')
provides=('chronicler')
conflicts=()
url="https://github.com/mak-kirkland/${pkgname%-*}"
source=(
    "https://github.com/mak-kirkland/${pkgname%-*}/releases/download/v${pkgver//_/-}/Chronicler_${pkgver%_*}_amd64.deb"
    "https://raw.githubusercontent.com/mak-kirkland/${pkgname%-*}/v${pkgver//_/-}/LICENSE"
)
sha256sums=('7a9cd27ab6aea3b09c0f3649358c440cb1a6229c725450fa296995741001c861'
            '4b4b7f846a2a8865f82a40eb0c475f534c9c044bd202536ad35e1060bd27dc5d')


prepare() {
    ar x Chronicler_${pkgver%_*}_amd64.deb
}

package() {
    install -Dm644 $srcdir/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    tar xzf $srcdir/data.tar.gz -C $pkgdir
}
