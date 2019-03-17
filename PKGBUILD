pkgname=lrexlib-pcre5.1
pkgver=2.9.0
pkgrel=2
pkgdesc="PCRE Library for Lua 5.1"
arch=('i686' 'x86_64')
url="http://rrthomas.github.com/lrexlib/"
license=('MIT')
depends=('lua51')
makedepends=('luarocks')

build() {
  luarocks --lua-version=5.1 --tree="${srcdir}" build lrexlib-pcre
}

package() {
  mkdir -p "${pkgdir}/usr/lib/lua/5.1"
  install -m 755 "${srcdir}/lib/lua/5.1/rex_pcre.so" \
    "${pkgdir}/usr/lib/lua/5.1/rex_pcre.so"
}

