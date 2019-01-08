# Maintainer: Alad Wenter <alad@archlinux.org>
# Contributor: Andrew Rabert <draje@nullsum.net>
# Contributor: Filippo Veneri <filippo[dot]veneri[at]gmail[dot]com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
pkgname=acpilight
pkgver=1.1
pkgrel=2
pkgdesc="a backward-compatible xbacklight replacement based on ACPI"
arch=('any')
url='https://gitlab.com/wavexx/acpilight'
license=('GPL3')
depends=('python')
provides=('xorg-xbacklight')
conflicts=('xorg-xbacklight')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2")
install=$pkgname.install
sha256sums=('0a5ef16a39c05c1eb195823d906c08f8f912aa48122b31e6dd364c7f9d6c37aa')

package() {
    cd "$pkgname-v$pkgver"

    install -Dm755 xbacklight "$pkgdir"/usr/bin/xbacklight
    install -Dm644 xbacklight.1 "$pkgdir"/usr/share/man/man1/xbacklight.1
    install -Dm644 90-backlight.rules "$pkgdir"/usr/lib/udev/rules.d/90-backlight.rules
    install -Dm644 README.rst NEWS.rst -t "$pkgdir"/usr/share/doc/acpilight
}
