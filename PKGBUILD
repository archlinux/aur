# Maintainer: Egor Tensin <Egor.Tensin@gmail.com>
pkgname=linux-status
pkgver=0.0.1
pkgrel=1
pkgdesc='Simple Linux status web page'
arch=(any)
url='https://github.com/egor-tensin/linux-status'
license=(MIT)
depends=(procps-ng python systemd)
install=linux-status.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=(SKIP)

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -D -m 0644 -t "$pkgdir/usr/share/linux-status" LICENSE.txt

    install -D -m 0644 -t "$pkgdir/usr/share/doc/linux-status" README.md
    install -D -m 0644 -t "$pkgdir/usr/share/doc/linux-status/img" img/example.png

    install -D -m 0755 -t "$pkgdir/srv/linux-status" app.py
    install -D -m 0755 -t "$pkgdir/srv/linux-status" server.py

    install -D -m 0644 -t "$pkgdir/srv/linux-status" index.html
    install -D -m 0644 -t "$pkgdir/srv/linux-status/css" css/bootstrap.min.css
    install -D -m 0644 -t "$pkgdir/srv/linux-status/js" js/bootstrap.bundle.min.js
    install -D -m 0644 -t "$pkgdir/srv/linux-status/js" js/jquery-3.3.1.min.js

    install -D -m 0644 -t "$pkgdir/usr/lib/systemd/system" dist/systemd/linux-status.service
}
