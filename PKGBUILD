# Maintainer: Tom Vincent <aur@tlvince.com>
pkgname=prettierd
pkgver=0.16.0
pkgrel=2
pkgdesc="prettier, as a daemon, for ludicrous formatting speed."
url="https://github.com/fsouza/prettierd"
license=("ISC")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/@fsouza/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=("8a6b755fe5f5d896d8eb519334c27e069445e4aca2f05baca3343f2778ef3b6a")

prepare() {
  tar xf "${pkgname}-${pkgver}.tgz" package/LICENSE
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

