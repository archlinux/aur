# Maintainer: tioguda  <guda.flavio@gmail.com>
# Contributor: Sergiu Puscas <srg.pscs at gmail dot com>

pkgname=ghost-cli
pkgver=1.32.5
pkgrel=1
pkgdesc="CLI Tool for installing & updating Ghost"
arch=(any)
url="https://ghost.org"
license=(MIT)
depends=('nodejs-lts-jod' 'npm' 'pnpm')
optdepends=()
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('6b46f79ad0f4bcb76ba0bde2410c3dfed099a783804e8d2feeb116e236045a9b')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" ${pkgname}@${pkgver}
}
