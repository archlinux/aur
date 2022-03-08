# Maintainer: Kodi <kodicraft4@gmail.com>
pkgname=hentai.js
pkgver=3.3.0
pkgrel=1

pkgdesc="rule34.xxx wrapper written in electron"
arch=('x86_64')
url="https://github.com/KodiCraft/hentai.js"
license=('MIT')

depends=("nodejs" "npm")
makedepends=()
checkdepends=()
optdepends=("electron")
# provides=()
# conflicts=()
# replaces=()
# backup=()
# options=()
# install=
# changelog=
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
# noextract=()
md5sums=('2e0b5f5f43f9201bd9de9689c35424ad')
# validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
    npm install	--cache "${srcdir}/npm-cache"
}

build() {
  cd "$pkgname-$pkgver"
   
}

package() {
  cd "$pkgname-$pkgver"
  npm run package
  
  mkdir -p "$pkgdir/usr/local/lib/hentaijs"
  cp -rL "out/hentaijs-linux-x64/" "$pkgdir/usr/local/lib/hentaijs/"
  touch "$pkgdir/usr/local/lib/hentaijs/hentaijs-linux-x64/.noupdates"
  chmod 755 -R "$pkgdir/usr/local/lib/hentaijs/" 
  mkdir -p "$pkgdir/usr/local/bin/"
  ln -sr "$pkgdir/usr/local/lib/hentaijs/hentaijs-linux-x64/hentaijs" "$pkgdir/usr/local/bin/hentai.js"
}


