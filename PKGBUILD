# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Rick Kerkhof <rick.2889@gmail.com>
pkgname=soundnode
pkgver=7.0.0
pkgrel=1
pkgdesc="An opensource SoundCloud app for desktop"
arch=('x86_64' 'i686')
url="https://soundnode.github.io/soundnode-website/"
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
source=("soundnode-app::https://github.com/Soundnode/soundnode-app/archive/$pkgver.zip")
sha256sums=('f2c4ce7c8ad56ff56a48c048078c9653500a86430fb21159ae734bee51725d5a')

build() {
    cd soundnode-app-$pkgver
    npm i
    npm run package;linux
}

package() {
    cd soundnode-app-$pkgver
    npm install -g --user root --prefix "$pkgdir"/usr soundnode-app-$pkgver.tar.gz
}
