# Maintainer: Tom Vincent <aur@tlvince.com>
pkgname=prettierd
pkgver=0.26.1 # renovate: datasource=github-tags depName=fsouza/prettierd
pkgrel=1
pkgdesc="prettier, as a daemon, for ludicrous formatting speed."
url="https://github.com/fsouza/prettierd"
license=("ISC")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/@fsouza/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('aae1a7c3dcdbc7e98b4aa456ad090adec954258c65308a0e7ef1c55c7f5e54c9')

prepare() {
  tar xf "${pkgname}-${pkgver}.tgz" package/LICENSE
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

