# Maintainer: tmtaxman <tmtaxman2 at gmail dot com>

pkgname=omnidb-server-bin
pkgver=5.5.1
pkgrel=1
pkgdesc="OmniDB Server - web-based database management tool (headless server component)"
arch=('x86_64')
_source="https://github.com/heptau/omnidb"
url='https://www.omnidb.net/'
license=('MIT')
provides=('omnidb-server')
conflicts=('omnidb-bin' 'omnidb-server')
depends=('glibc')
options=('!debug')

source=("$pkgname-$pkgver.tar.gz::$_source/releases/download/v$pkgver/OmniDB-linux-x64.tar.gz"
  "$pkgname-LICENSE::https://raw.githubusercontent.com/heptau/omnidb/refs/heads/master/LICENSE")
sha256sums=('0f8e298db59a3c5f2804165589cfda922892a95e3bce14c26a4733b5c1841ef5'
            'f0d93a9344e68bfd296783b282d1fec6971a063ce44ced52f7dbd426ec68e4b6')

package() {
  cd "OmniDB-linux"
  install -Dm755 "omnidb-server" "$pkgdir/usr/bin/omnidb-server"
  install -Dm644 "$srcdir/$pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
