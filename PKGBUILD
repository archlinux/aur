# Maintainer: Timothée Andres <andres.timothee+aur@gmail.com>
# Contributor: Nikoloz Shvelidze <shveloo@gmail.com>
pkgname=chronicler-bin
pkgver=0.61.1_alpha
pkgrel=1
pkgdesc="The free offline worldbuilding tool for writers and GMs."
arch=('x86_64')
license=('LicenseRef-PolyForm-Shield-1.0.0')
depends=('webkit2gtk-4.1' 'gtk3' 'gdk-pixbuf2' 'libgcc' 'libsoup3' 'hicolor-icon-theme' 'glibc' 'glib2' 'dbus' 'cairo')
provides=('chronicler')
conflicts=()
url="https://github.com/mak-kirkland/${pkgname%-*}"
source=(
    "${pkgname}_${pkgver}_amd64.deb::https://github.com/mak-kirkland/${pkgname%-*}/releases/download/v${pkgver//_/-}/Chronicler_${pkgver%_*}_amd64.deb"
    "LICENSE-${pkgname}_${pkgver}::https://raw.githubusercontent.com/mak-kirkland/${pkgname%-*}/v${pkgver//_/-}/LICENSE"
)
sha256sums=('c1449cb23a5478eb62e5ea69b0942c3167a655071ebd9cebbfec1d6ef9b16d0d'
            '4b4b7f846a2a8865f82a40eb0c475f534c9c044bd202536ad35e1060bd27dc5d')


prepare() {
    ar x ${pkgname}_${pkgver}_amd64.deb
}

package() {
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 $srcdir/LICENSE-${pkgname}_${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    tar xzf $srcdir/data.tar.gz -C $pkgdir
}
