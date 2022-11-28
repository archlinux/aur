# Maintainer: Tom Vincent <aur@tlvince.com>
pkgname=prettierd
pkgver=0.22.5
pkgrel=1
pkgdesc="prettier, as a daemon, for ludicrous formatting speed."
url="https://github.com/fsouza/prettierd"
license=("ISC")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/@fsouza/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('81c9006358a8eb428cd3f5455d6061359e4c7c04e7aaf569db64e33a6664d2d6')

prepare() {
  tar xf "${pkgname}-${pkgver}.tgz" package/LICENSE
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

