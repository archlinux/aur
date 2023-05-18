# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=algernon-bin
pkgver=1.15.1
pkgrel=1
pkgdesc='Web server with Lua, Markdown, QUIC, Redis and PostgreSQL support'
arch=(aarch64 armv6 armv7 x86_64)
url='https://algernon.roboticoverlords.org/'
license=(BSD)
makedepends=(go)
conflicts=(algernon)
replaces=(algernon)
optdepends=('mariadb: For using the MariaDB/MySQL database backend'
            'postgresql: For using the PostgreSQL database backend'
            'redis: For using the Redis database backend')
source=("algernon-$pkgver.tar.gz::https://github.com/xyproto/algernon/releases/download/v$pkgver/algernon-${pkgver}-linux_${CARCH}_static.tar.xz")
b2sums=('a1018c5b047cf90511ec5fe0724d7751defd66bd7fae148c04d3774d16da3224b67ec8c75fb9b1b8803c94185246e82170affcbab1829656dab5740d87229561')

package() {
  cd algernon-${pkgver}-linux_${CARCH}_static
  install -Dm755 algernon "$pkgdir/usr/bin/algernon"
  install -Dm644 algernon.1.gz "$pkgdir/usr/share/man/man1/algernon.1.gz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/algernon/LICENSE"
}
