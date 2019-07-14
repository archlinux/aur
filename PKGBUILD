pkgname=mwoffliner
pkgver=1.9.3
pkgrel=1
pkgdesc="Mediawiki/Parsoid HTML snapshot utility and ZIM file builder"
arch=(any)
url="https://github.com/openzim/mwoffliner#readme"
license=(GPL3)
depends=('nodejs' 'npm' 'jpegoptim' 'advancecomp' 'gifsicle' 'pngquant' 'imagemagick' 'zimwriterfs' 'redis')
optdepends=()
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=(12db5337bfd4996c2e266f63aa243744d104a05a0c9db6313a088e6031698706)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}

# vim:set ts=2 sw=2 et:
