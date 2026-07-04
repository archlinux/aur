# Maintainer: tioguda  <guda.flavio@gmail.com>
# Contributor: Sergiu Puscas <srg.pscs at gmail dot com>

pkgname=ghost-cli
pkgver=1.29.3
pkgrel=1
pkgdesc="CLI Tool for installing & updating Ghost"
arch=(any)
url="https://ghost.org"
license=(MIT)
depends=('nodejs' 'npm' 'pnpm')
optdepends=()
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('ffaf4be631fe1cd49300d8a6886d796a776254eb0252775ee9d9c6bd1a9b5725')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" ${pkgname}@${pkgver}
}
