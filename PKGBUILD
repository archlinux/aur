# Maintainer: mengh04 <mengh04@users.noreply.github.com>
pkgname=shotori
pkgver=0.16.0
pkgrel=1
pkgdesc="Wayland-first screenshot tool with built-in OCR, self-drawn UI via gpui-kit"
arch=('x86_64')
url="https://github.com/mengh04/shotori"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'libxau' 'libxdmcp' 'libxkbcommon')
source=("shotori-${pkgver}-x86_64.tar.gz::https://github.com/mengh04/shotori/releases/download/v${pkgver}/shotori-v${pkgver}-x86_64.tar.gz")
sha256sums=('cc92c63e1cb711359af1609b584915ddc1c13ea45664a98efc1b8bd93cb44b80')

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
