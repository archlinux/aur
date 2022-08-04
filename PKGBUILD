# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=algernon-bin
pkgver=1.14.0
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
b2sums=('d904c37d67c76038967ee6babd166b5aa76d829e328d9e41d571dcf27ac83d2c386b1ed7b708f2f3d2d43285e9671717d55b6af9a32e5013d4b35267ff53435a')

package() {
  cd algernon-${pkgver}-linux_${CARCH}_static
  install -Dm755 algernon "$pkgdir/usr/bin/algernon"
  install -Dm644 algernon.1.gz "$pkgdir/usr/share/man/man1/algernon.1.gz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/algernon/LICENSE"
}
