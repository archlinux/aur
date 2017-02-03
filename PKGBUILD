# Maintainer: Brandon Carpenter [hashstat (at) yahoo (dot) com]
pkgname=rhythmbox-equalizer
_gitrev=aa34ada
pkgver=15.01.06.$_gitrev
pkgrel=2
pkgdesc="10 band graphical equalizer for Rhythmbox"
arch=(any)
url=http://luqmana.github.io/rhythmbox-plugins
license=(unknown)
depends=(gconf python rhythmbox)
source=(rhythmbox-plugins.tar.gz::http://github.com/luqmana/rhythmbox-plugins/tarball/master)
md5sums=(19d9171ae2ca62e78a28a144da47ef3b)

package() {
  local plugindir="$pkgdir"/usr/lib/rhythmbox/plugins/equalizer
  local uidir="$pkgdir"/usr/share/rhythmbox/plugins/equalizer

  install -d "$plugindir" "$uidir"

  cd luqmana-rhythmbox-plugins-$_gitrev/equalizer
  install -m 0644 equalizer.plugin3 "$plugindir"/equalizer.plugin
  install -m 0644 *.py "$plugindir"
  install -m 0644 *.ui "$uidir"

  cd "$plugindir"
  python -m compileall *.py
  python -O -m compileall *.py
}

# vim:set ts=2 sw=2 et:
