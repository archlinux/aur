# Maintainer: tioguda  <guda.flavio@gmail.com>
# Contributor: Sergiu Puscas <srg.pscs at gmail dot com>

pkgname=ghost-cli
pkgver=1.32.2
pkgrel=1
pkgdesc="CLI Tool for installing & updating Ghost"
arch=(any)
url="https://ghost.org"
license=(MIT)
depends=('nodejs-lts-jod' 'npm' 'pnpm')
optdepends=()
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('6e919bf0dc2779c890e36247720363734367e4b6430be279d21adb847dcebf8f')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" ${pkgname}@${pkgver}
}
