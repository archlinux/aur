# Maintainer: tmtaxman <tmtaxman2 at gmail dot com>

pkgname=omnidb-bin
pkgver=4.4.3
pkgrel=1
pkgdesc="OmniDB Desktop Application"
arch=('x86_64')
_source="https://github.com/heptau/omnidb"
url='https://www.omnidb.net/'
license=('MIT')
provides=('omnidb' 'omnidb-server')
conflicts=('omnidb' 'omnidb-server' 'omnidb-server-bin')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'gdk-pixbuf2' 'libsoup3' 'hicolor-icon-theme')
options=('!strip' '!debug')

source=("$pkgname-$pkgver.tar.gz::$_source/releases/download/v$pkgver/OmniDB-linux-x64.tar.gz"
    "$pkgname-LICENSE::https://raw.githubusercontent.com/heptau/omnidb/refs/heads/master/LICENSE"
    "omnidb.png::https://raw.githubusercontent.com/heptau/omnidb/master/wails-app/build/appicon.png"
    "omnidb.desktop")
sha256sums=('a299e440b84b1a7ffa5f98fb773eaef201ee26552bd75ad08188d925e87c1a82'
    'f0d93a9344e68bfd296783b282d1fec6971a063ce44ced52f7dbd426ec68e4b6'
    '12824039da10612b441a9d9a4f0ee6ad21577a9e1dba3ec5f05c8e34d77f7961'
    '0fbc312890bb239d5f23a75faddcc0b778c42dd1c847ba5037708ba8af13e7d7')

package() {
    cd "OmniDB-linux"
    install -Dm755 "OmniDB" "$pkgdir/usr/bin/omnidb"
    install -Dm755 "omnidb-server" "$pkgdir/usr/bin/omnidb-server"
    install -Dm644 "$srcdir/$pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/omnidb.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/omnidb.png"
    install -Dm644 "$srcdir/omnidb.desktop" "$pkgdir/usr/share/applications/omnidb.desktop"
}
