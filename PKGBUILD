# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=hetzner-k3s
pkgver=2.2.9
pkgrel=1
pkgdesc="The easiest and fastest way to create and manage Kubernetes clusters in Hetzner Cloud using the lightweight distribution k3s by Rancher."
arch=(x86_64)
url="https://github.com/vitobotta/hetzner-k3s"
license=(MIT)
depends=(libevent libyaml pcre gmp)
makedepends=(shards crystal)
source=("$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3855e009b2ca36947a5a91b96d63a26d97c8cc50d706ff161e747971238fa5f4')
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
