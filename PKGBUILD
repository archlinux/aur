# Maintainer: Keith Scroggs <very-amused@pm.me>
pkgname='my_timers'
pkgver=0.1.0
pkgrel=1
pkgdesc='my_timers is a multithreaded MariaDB/MySQL event runner, which can function as a complete replacement for event_scheduler.'
arch=('x86_64')
url='https://github.com/very-amused/my_timers'
license=('MIT')

depends=('openssl>=3.0.7')
makedepends=('make>=4.3')
optdepends=('mariadb: database server (recommended)'
            'mysql: database server')
source=("https://github.com/very-amused/my_timers/releases/download/v$pkgver/x86_64-linux.tar.gz")
sha256sums=('bc869c2550d1958920bf6482f1d1fcdb67c0d6ca419959669fae4b8fd1f3e1e8')

package() {
  cd "release/x86_64-linux"
  make DESTDIR=$pkgdir PREFIX=/usr install
}
