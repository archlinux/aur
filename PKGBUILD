# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=algernon-bin
pkgver=1.13.0
pkgrel=2
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
b2sums=('bd2a56b01850c1040ef1f63dd4fcc0b3b0c45dbac9251f3864d2cc9b9c3bc8b8fe8905e180274105c7bd9f5004a7d37a1627d60ddd33fa3f10e67b76f81422b1')

package() {
  cd algernon-${pkgver}-linux_${CARCH}_static
  install -Dm755 algernon "$pkgdir/usr/bin/algernon"
  install -Dm644 algernon.1.gz "$pkgdir/usr/share/man/man1/algernon.1.gz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/algernon/LICENSE"
}
