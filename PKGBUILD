# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-pgmoon' 'lua51-pgmoon' 'lua52-pgmoon' 'lua53-pgmoon')
_pkgbase='pgmoon'
pkgver=1.11.0
pkgrel=2
arch=('any')
url='https://github.com/leafo/pgmoon'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leafo/pgmoon/archive/v$pkgver.tar.gz"
"${_pkgbase}-lua53-compat.patch")
md5sums=('fbfa084ff9947b1d2552357dde2e25c8'
'b25c48ed67c2b70011333eaa1f8292c3')

prepare() {
    cd "${_pkgbase}-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/${_pkgbase}-lua53-compat.patch"
}

package_lua-pgmoon() {
    pkgdesc='PostgreSQL driver written in pure Lua for Lua 5.4'
    depends=('lua-lpeg')
    optdepends=('lua-cqueues: asynchronous connectivity'
                'lua-socket: synchronous connectivity')

    cd "pgmoon-$pkgver"
    install -Dm644 pgmoon.lua "$pkgdir/usr/share/lua/5.4/pgmoon.lua"
    install -Dm644 pgmoon/*.lua -t "$pkgdir/usr/share/lua/5.4/pgmoon"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-pgmoon() {
    pkgdesc='PostgreSQL driver written in pure Lua for Lua 5.1'
    depends=('lua-lpeg' 'lua51-bitop')
    optdepends=('lua-cqueues: asynchronous connectivity'
                'lua-socket: synchronous connectivity')

    cd "pgmoon-$pkgver"
    install -Dm644 pgmoon.lua "$pkgdir/usr/share/lua/5.1/pgmoon.lua"
    install -Dm644 pgmoon/*.lua -t "$pkgdir/usr/share/lua/5.1/pgmoon"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-pgmoon() {
    pkgdesc='PostgreSQL driver written in pure Lua for Lua 5.2'
    depends=('lua-lpeg' 'lua52-bitop')
    optdepends=('lua-cqueues: asynchronous connectivity'
                'lua-socket: synchronous connectivity')

    cd "pgmoon-$pkgver"
    install -Dm644 pgmoon.lua "$pkgdir/usr/share/lua/5.2/pgmoon.lua"
    install -Dm644 pgmoon/*.lua -t "$pkgdir/usr/share/lua/5.2/pgmoon"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-pgmoon() {
    pkgdesc='PostgreSQL driver written in pure Lua for Lua 5.3'
    depends=('lua-lpeg')
    optdepends=('lua-cqueues: asynchronous connectivity'
                'lua-socket: synchronous connectivity')

    cd "pgmoon-$pkgver"
    install -Dm644 pgmoon.lua "$pkgdir/usr/share/lua/5.3/pgmoon.lua"
    install -Dm644 pgmoon/*.lua -t "$pkgdir/usr/share/lua/5.3/pgmoon"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
