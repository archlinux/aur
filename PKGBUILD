# Maintainer:  BBaoVanC <bbaovanc@bbaovanc.com>
# Contributor: Federico Cinelli <cinelli@aur.archlinux.org>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Isaac Dupree <id@isaac.cedarswampstudios.org>
# Contributor: Sebastien Duquette <ekse.0x@gmail.com>

pkgname=smem
pkgver=1.5
pkgrel=4
pkgdesc="Generate reports on memory usage."
url="https://www.selenic.com/smem/"
license=("GPL")
depends=('python')
optdepends=('python-matplotlib: for chart generation')
arch=('x86_64')
source=("$pkgname-$pkgver.tgz::https://www.selenic.com/repo/smem/archive/$pkgver.tar.gz")
sha256sums=('5c3907b0ac9d3252cbbc5cb9ebe93f0c2b602df67376d9050c09146871822293')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make smemcap
  # smem itself doesn't need to be compiled because it's python
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 smem "$pkgdir/usr/bin/smem"
  install -Dm755 smemcap "$pkgdir/usr/bin/smemcap"
  install -Dm644 smem.8 "$pkgdir/usr/share/man/man8/smem.8"
}

