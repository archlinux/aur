# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=hetzner-k3s
pkgver=2.2.8
pkgrel=1
pkgdesc="The easiest and fastest way to create and manage Kubernetes clusters in Hetzner Cloud using the lightweight distribution k3s by Rancher."
arch=(x86_64)
url="https://github.com/vitobotta/hetzner-k3s"
license=(MIT)
depends=(libevent libyaml pcre gmp)
makedepends=(shards crystal)
source=("$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('855ee1781c483d94b789d52549fd0ffeef3ecbd5990e1ca32d8cd983877cbbc9')
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
