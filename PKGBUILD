# Maintainer: Florian Walch <florian+aur@fwalch.com>
# Contributor: Florian Hahn <flo@fhahn.com>

pkgbase=lua-messagepack
pkgname=(lua51-messagepack lua52-messagepack lua-messagepack)
pkgver=0.3.3
pkgrel=1
arch=('any')
url='https://fperrad.github.io/lua-MessagePack'
license=('MIT')
source=("https://github.com/fperrad/lua-MessagePack/archive/${pkgver}.tar.gz")
sha256sums=('40e86eacac87f4deaa566cdefaaa1ec6ca90ad14a9419805ea90d069736cfda6')

package_lua51-messagepack() {
  pkgdesc='Implementation of MessagePack spec v5 for Lua 5.1.'
  depends=('lua51')

  cd "lua-MessagePack-${pkgver}"
  make LUAVER=5.1 PREFIX="/usr" DESTDIR="${pkgdir}" install
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_lua52-messagepack() {
  pkgdesc='Implementation of MessagePack spec v5 for Lua 5.2.'
  depends=('lua52')

  cd "lua-MessagePack-${pkgver}"
  make LUAVER=5.2 PREFIX="/usr" DESTDIR="${pkgdir}" install
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_lua-messagepack() {
  pkgdesc='Implementation of MessagePack spec v5 for Lua 5.3.'
  depends=('lua')
  provides=("lua53-messagepack=${pkgver}")
  conflicts=('lua53-messagepack')

  cd "lua-MessagePack-${pkgver}"
  make LUAVER=5.3 PREFIX="/usr" DESTDIR="${pkgdir}" install
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
