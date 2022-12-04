_npmname=mctranslate-cli
_npmver=1.0.3
pkgname=mctranslate-cli # All lowercase
pkgver=1.0.3
pkgrel=1
pkgdesc="A CLI Tool for translate a sentence into minecraft enchanting alphabet"
arch=(any)
url="https://github.com/SantiagoAvila21/MinecraftTranslator"
license=('GNU General Public License v3.0')
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(39412958c4f3f77c4900e5a762d2b8488e4c83ff)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
