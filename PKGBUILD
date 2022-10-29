# Maintainer: 	whitels <2959471117 at qq dot com>

_npmname=whistle.inspect
_npmver=2.2.5
_npmrel=1
pkgname=nodejs-whistle-plugins-inspect # All lowercase
pkgver=2.2.5
pkgrel=1
pkgdesc="集成 vConsole、eruda、mdebug 等调试H5页面工具的插件"
arch=(any)
url="https://github.com/whistle-plugins/whistle.inspect"
license=(MIT)
depends=('nodejs' 'npm' 'nodejs-whistle')
optdepends=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=($_npmname-$_npmver.tgz)
sha1sums=('81274bdc138bea57e57f9d6a1f1e2cef25613878')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
