# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=hetzner-k3s
pkgver=2.2.7
pkgrel=1
pkgdesc="The easiest and fastest way to create and manage Kubernetes clusters in Hetzner Cloud using the lightweight distribution k3s by Rancher."
arch=(x86_64)
url="https://github.com/vitobotta/hetzner-k3s"
license=(MIT)
depends=(libevent jq libyaml pcre gmp)
makedepends=(shards crystal)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9267555fc0a5711d9721f0393f77c55bd9c3eccc84f19dfafaa1554061ad0c4c')
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
