# Contributor: Jordan Wade <jordan@jwade.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=luamacro
pkgver=2.5.0.2.gf38ecbf
pkgrel=1
pkgdesc="A macro preprocessor for Lua"
arch=('i686' 'x86_64')
url="http://yaml.luaforge.net/"
license=('MIT' 'custom')
depends=('lua')
# URL doesn't change predictably with version number, so it's hardcoded
#source=(luamacro::git+https://github.com/stevedonovan/LuaMacro.git)
#md5sums=('SKIP')
options=(!'makeflags')

#pkgver() {
#  cd $srcdir/luamacro
#  git describe --tags | sed 's|-|.|g' 
#}

package() {
 # cd $srcdir/luamacro
 # install -Dm644 macro.lua $pkgdir/usr/share/lua5.2/macro.lua
 # install -d $pkgdir/usr/share/lua5.2/macro
 # cp -r macro $pkgdir/usr/share/lua5.2/macro

  # install -Dm755 luam $pkgdir/usr/bin/luam
  luarocks install --tree=$pkgdir/usr luamacro
  rm $pkgdir/usr/lib/luarocks/rocks-5.2/manifest 
}
