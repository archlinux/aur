# Maintainer: Tom Vincent <aur@tlvince.com>
pkgname=prettierd
pkgver=0.25.1 # renovate: datasource=github-tags depName=fsouza/prettierd
pkgrel=1
pkgdesc="prettier, as a daemon, for ludicrous formatting speed."
url="https://github.com/fsouza/prettierd"
license=("ISC")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/@fsouza/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('9b19f11c6b099c518fc8d4c0b6da697c8e15796fb2bb4ab689737f084d29ac3f')

prepare() {
  tar xf "${pkgname}-${pkgver}.tgz" package/LICENSE
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

