# Maintainer: Tim Yang <protonmail = timdyang>

pkgname=gnome-shell-extension-x11gestures
_uuid=x11gestures@joseexposito.github.io
pkgver=1
pkgrel=1
pkgdesc="Enable GNOME Shell multi-touch gestures on X11"
arch=(any)
url=https://github.com/JoseExposito/$pkgname
license=(GPL)
depends=(gnome-shell touchegg)
install=$pkgname.install
source=(https://github.com/JoseExposito/$pkgname/releases/download/$pkgver/$_uuid.zip)
noextract=($_uuid.zip)
sha256sums=(8389378b48f67e2510db582da4dfa3d97a5653f224a2695f32c740577c44bf51)

package() {
    bsdtar -xf "$srcdir"/$_uuid.zip \
        -C "$pkgdir" \
        -s ":^:usr/share/gnome-shell/extensions/$_uuid/:"

    rm -f "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid/COPY*
    find "$pkgdir" -type d -exec chmod 755 '{}' +
    find "$pkgdir" -type f -exec chmod 644 '{}' +
}
