# Maintainer: Anthony Wang <a aat unnamed dt website>
pkgname=fotd
pkgver=1.0.0
pkgrel=1
pkgdesc="Fortune of the day"
arch=(any)
url="https://codeberg.org/exozyme/packages"
license=('GPL')
conflicts=('fortune-mod')
backup=('etc/fortune' 'etc/motd.d/fortune')
source=("fortune"
        "systemd.service"
        "systemd.timer")
sha256sums=('6cc31663003d7208c3b188e6529fe5b4933cefefa0a33a205ab12ca3400632a2'
            'd220d733e08e57fe8d9c048a6deec88553034e36c1828dd778bda544e7b2202b'
            '91121ae4298f29502e9142006ccc4f95f0eef089e6e3aa6a7ccc6ff7651591c0')

package() {
	install -vDm755 fortune "$pkgdir/usr/bin/fortune"
	install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -vDm644 systemd.timer "$pkgdir/usr/lib/systemd/system/$pkgname.timer"
	install -vDm644 /dev/null "$pkgdir/etc/fortune"
	install -vDm644 /dev/null "$pkgdir/etc/motd.d/fortune"
}
