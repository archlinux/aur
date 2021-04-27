# Maintainer: Tim Yang <protonmail = timdyang>

pkgname=gnome-shell-extension-x11gestures
_uuid=x11gestures@joseexposito.github.io
pkgver=7
pkgrel=1
pkgdesc="Enable GNOME Shell multi-touch gestures on X11"
arch=(any)
url=https://github.com/JoseExposito/$pkgname
license=(GPL)
depends=(gnome-shell touchegg)
install=$pkgname.install
source=($_uuid-$pkgver.zip::https://github.com/JoseExposito/$pkgname/releases/download/$pkgver/$_uuid.zip)
noextract=($_uuid-$pkgver.zip)
sha256sums=(f0666ee0e85f75bb5999fc844294ca504344ddf266477d78a5598898045b1181)

package() {
    bsdtar -xf "$srcdir"/$_uuid-$pkgver.zip \
        -C "$pkgdir" \
        -s ":^:usr/share/gnome-shell/extensions/$_uuid/:"

    rm -f "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid/COPY*
    find "$pkgdir" -type d -exec chmod 755 '{}' +
    find "$pkgdir" -type f -exec chmod 644 '{}' +
}
