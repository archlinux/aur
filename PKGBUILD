pkgname=lua51-dbus_proxy
_pkgname=lua-dbus_proxy
_modname=dbus_proxy
pkgver=0.10.4
pkgrel=1
pkgdesc="Simple API around GLib's GIO:GDBusProxy built on top of lgi"
arch=(any)
license=(Apache-2.0)
url=https://github.com/stefano-m/lua-dbus_proxy
depends=(lua51-lgi)
optdepends=(
  "lua51: Lua 5.1 implementation"
  "luajit: Alternative Lua 5.1 implementation"
)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('fe3445f53e0a53231a4671bc62afcbc68e095ea9b6f771437f4747a881359897bc1682639ba124628c15be6ed69d01a4215cf71d2935137f399b5f98be2cb5f8')

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -Dm644 -t "$pkgdir/usr/lib/lua/5.1/$_modname" src/$_modname/*
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" CHANGELOG README.md
}
