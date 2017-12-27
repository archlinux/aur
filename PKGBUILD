# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

pkgname='tempreader'
pkgver='1.0.0'
pkgrel=1
pkgdesc='RESTful API to read data from DS18B20 temperature sensors.'
url="https://github.com/jtyr/tempreader"
arch=('x86_64' 'arm')
license=('MIT')
conflicts=('tempreader-git')
source_x86_64=("https://github.com/jtyr/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-linux-amd64.tar.gz")
source_arm=("https://github.com/jtyr/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-linux-arm.tar.gz")
sha256sums_x86_64=('b39be7fdd43efa02e1c0b4c00219e9ecee10b65d0fa49c7d57c61daf7e784fdc')
sha256sums_arm=('72a85582898b7f332297ad10facc19feb54a78ba4c514daa3f50f52babba9498')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/$pkgname-$pkgver/"{LICENSE,README.md} -t "$pkgdir/usr/doc/$pkgname"
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.default" "$pkgdir/etc/default/$pkgname"
}
