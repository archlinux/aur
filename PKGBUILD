pkgname=mwoffliner
pkgver=1.10.0
pkgrel=1
pkgdesc="Mediawiki/Parsoid HTML snapshot utility and ZIM file builder"
arch=(any)
url="https://github.com/openzim/mwoffliner#readme"
license=(GPL3)
depends=('zimwriterfs>=1.3.7' 'nodejs' 'npm' 'jpegoptim' 'advancecomp' 'gifsicle' 'pngquant' 'imagemagick' 'redis')
optdepends=()
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=(44f7e6b95e774c53a527917a5a120de7a46f4895abfdeaf6199553b0d498bc80)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}

# vim:set ts=2 sw=2 et:
