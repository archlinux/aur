# Maintainer: tioguda  <guda.flavio@gmail.com>
# Contributor: Sergiu Puscas <srg.pscs at gmail dot com>

pkgname=ghost-cli
pkgver=1.33.3
pkgrel=1
pkgdesc="CLI Tool for installing & updating Ghost"
arch=(any)
url="https://ghost.org"
license=(MIT)
depends=('nodejs-lts-jod' 'npm' 'pnpm')
optdepends=()
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('f56a5e6c66aa6e627fca45a5cd543a4e9823ec1cca603f44a32484c393015b56')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" ${pkgname}@${pkgver}
}
