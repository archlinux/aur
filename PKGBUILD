# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=hetzner-k3s
pkgver=2.4.0
pkgrel=1
pkgdesc="The easiest and fastest way to create and manage Kubernetes clusters in Hetzner Cloud using the lightweight distribution k3s by Rancher."
arch=(x86_64)
url="https://github.com/vitobotta/hetzner-k3s"
license=(MIT)
depends=(libevent libyaml pcre gmp)
makedepends=(shards crystal)
source=("$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('492390e5e1308968e698fc84ecccd3912f3b070c98c79730415f4bcc7b20bb4f')
provides=("hetzner-k3s=$pkgver")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    shards build --production
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    cp bin/hetzner-k3s "$pkgdir/usr/bin/hetzner-k3s"
}
