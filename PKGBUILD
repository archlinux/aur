pkgname=mwoffliner
pkgver=1.10.7
pkgrel=2
pkgdesc="Mediawiki/Parsoid HTML snapshot utility and ZIM file builder"
arch=(any)
url="https://github.com/openzim/mwoffliner#readme"
license=(GPL3)
depends=('zimwriterfs>=1.3.7' 'nodejs' 'npm' 'jpegoptim' 'advancecomp' 'gifsicle' 'pngquant' 'imagemagick' 'redis')
optdepends=()
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=(f5e99dc1ead060d590108b12c25d8006d8b4bac2338a47170e19c2219626f5d9)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}

# vim:set ts=2 sw=2 et:
