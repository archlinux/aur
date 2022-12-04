_npmname=mctranslate-cli
_npmver=1.0.2
pkgname=mctranslate-cli # All lowercase
pkgver=1.0.2
pkgrel=1
pkgdesc="A CLI Tool for translate a sentence into minecraft enchanting alphabet"
arch=(any)
url="https://github.com/SantiagoAvila21/MinecraftTranslator"
license=(GNU General Public License v3.0)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(20be140b7135108d6afe5357104d7fd8d29caecf)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
