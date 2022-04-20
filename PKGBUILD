# Maintainer: Tom Vincent <aur@tlvince.com>
pkgname=prettierd
pkgver=0.20.0
pkgrel=1
pkgdesc="prettier, as a daemon, for ludicrous formatting speed."
url="https://github.com/fsouza/prettierd"
license=("ISC")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/@fsouza/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('7e811a29bd10633fb2b7aec6de025f85a509fb689690c07af2619bc3addd8dc3')

prepare() {
  tar xf "${pkgname}-${pkgver}.tgz" package/LICENSE
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

