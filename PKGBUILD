# Maintainer: Tim Yang <protonmail = timdyang>

pkgname=gnome-shell-extension-x11gestures
_uuid=x11gestures@joseexposito.github.io
pkgver=6
pkgrel=1
pkgdesc="Enable GNOME Shell multi-touch gestures on X11"
arch=(any)
url=https://github.com/JoseExposito/$pkgname
license=(GPL)
depends=(gnome-shell touchegg)
install=$pkgname.install
source=($_uuid-$pkgver.zip::https://github.com/JoseExposito/$pkgname/releases/download/$pkgver/$_uuid.zip)
noextract=($_uuid.zip)
sha256sums=(09989eea5902622f9f90f44409931232617527ae1a7472283b740af289964a24)

package() {
    bsdtar -xf "$srcdir"/$_uuid-$pkgver.zip \
        -C "$pkgdir" \
        -s ":^:usr/share/gnome-shell/extensions/$_uuid/:"

    rm -f "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid/COPY*
    find "$pkgdir" -type d -exec chmod 755 '{}' +
    find "$pkgdir" -type f -exec chmod 644 '{}' +
}
