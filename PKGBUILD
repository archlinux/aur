# Maintainer: mengh04 <mengh04@users.noreply.github.com>
pkgname=shotori
pkgver=0.20.0
pkgrel=1
pkgdesc="Wayland-first screenshot tool with built-in OCR, self-drawn UI via gpui-kit"
arch=('x86_64')
url="https://github.com/mengh04/shotori"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'libxau' 'libxdmcp' 'libxkbcommon')
source=("shotori-${pkgver}-x86_64.tar.gz::https://github.com/mengh04/shotori/releases/download/v${pkgver}/shotori-v${pkgver}-x86_64.tar.gz")
sha256sums=('084d50e67ceefcb5b137661641c07fe0490e7e6be3600402b601b8d0df194f6c')

package() {
    install -Dm0755 shotori -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# shotori-desktop-assets
eval "$(declare -f package | sed '1s/package/package_without_desktop/')"
package() {
    package_without_desktop
    DESTDIR="$pkgdir" sh "$srcdir/scripts/install-desktop.sh" /usr
}
