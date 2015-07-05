# Maintainer: strata <strata@dropswitch.net>
pkgname=lrexlib-pcre5.1
pkgver=2.7.2
pkgrel=1
pkgdesc="PCRE Library for Lua 5.1"
arch=('i686' 'x86_64')
url="http://rrthomas.github.com/lrexlib/"
license=('MIT')
depends=('lua51')
makedepends=('luarocks5.1')

build() {
  luarocks-5.1 --tree="${srcdir}" build lrexlib-pcre
}

package() {
  mkdir -p "${pkgdir}/usr/lib/lua/5.1"
  install -m 755 "${srcdir}/lib/lua/5.1/rex_pcre.so" \
    "${pkgdir}/usr/lib/lua/5.1/rex_pcre.so"
}

# vim:set ts=2 sw=2 et:
