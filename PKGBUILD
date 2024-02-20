pkgname=gnome-shell-extension-screen-autorotate
pkgver=15
pkgrel=1
pkgdesc="A GNOME extension to auto-rotate screen regardless of touch mode"
arch=("any")
url="https://github.com/shyzus/gnome-shell-extension-screen-autorotate"
license=("GPL")
depends=("gnome-shell" "iio-sensor-proxy")
conflicts=("gnome-shell-extension-screen-autorotate-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('SKIP')
_uuid="screen-rotate@shyzus.github.io"

package() {

  source_dir="$srcdir/$pkgname-$pkgver/$_uuid"

  install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm755 -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}" "${source_dir}"/*.*

  install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas"
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" "${source_dir}/schemas"/*.xml

}