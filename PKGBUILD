# Maintainer: Ramadan Ali <rot13:ezqa@ezqa.ny>
pkgname=vte4-bin
pkgver=0.70.0
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget"
url="https://wiki.gnome.org/Apps/Terminal/VTE"
arch=("x86_64")
license=("GPL3")
groups=("gnome-extra")
depends=("gtk4" "pcre2" "gnutls" "fribidi" "systemd" "vte-common")
provides=("${pkgname%-bin}" "libvte-2.91-gtk4.so=0-64")
conflicts=("${pkgname%-bin}")
source=("https://kojipkgs.fedoraproject.org//packages/vte291/${pkgver}/1.fc38/x86_64/vte291-gtk4-${pkgver}-1.fc38.x86_64.rpm")
sha1sums=("e37b7cf55674c205432e69eba2c35245543c6782")

package() {
        rm -r $srcdir/usr/lib
        mv $srcdir/usr/lib64 $srcdir/usr/lib
        mv $srcdir/usr $pkgdir/usr
}
