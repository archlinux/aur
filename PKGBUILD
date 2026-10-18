# Maintainer: tioguda  <guda.flavio@gmail.com>
# Contributor: Sergiu Puscas <srg.pscs at gmail dot com>

pkgname=ghost-cli
pkgver=1.33.7
pkgrel=1
pkgdesc="CLI Tool for installing & updating Ghost"
arch=(any)
url="https://ghost.org"
license=(MIT)
depends=('nodejs-lts-jod' 'npm' 'pnpm')
optdepends=()
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('1aac77730da7fe933e9ca41a95e5e7cbc3f5b4ea84f9b7d557b3f3d3bc1391ac')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" ${pkgname}@${pkgver}
}
