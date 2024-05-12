# Maintainer: Paolo De Donato <dedonato 95 at hotmail dot it>

pkgname=eww-systemd
pkgver=1.0
pkgrel=2
pkgdesc="Integration of eww with systemd services manager "
url='https://github.com/Loara/eww-systemd'
arch=(any)
license=('GPL-3.0-or-later')
depends=(systemd)
optdepends=('eww: ElKowars wacky widgets')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Loara/eww-systemd/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b313c3f228f18405dc956816729630ace4faf7741a46d34799d3290fbc47e88b4aaa5155b25867c088f26860075887378e4620ef37e49f5e1ed3f429c773f6c6')

package() {
    cd "$srcdir/eww-systemd-$pkgver/"
    pwd
    install -T -Dm0644 "eww.service" "$pkgdir/usr/lib/systemd/user/eww.service"
    install -T -Dm0644 "eww-open@.service" "$pkgdir/usr/lib/systemd/user/eww-open@.service"
}
