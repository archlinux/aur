# Maintainer: Kodi <kodicraft4@gmail.com>
pkgname=hentai.js
pkgver=2.3.6
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
md5sums=("SKIP")
# validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
  npm install	--cache "${srcdir}/npm-cache"
}

build() {
  cd "$pkgname-$pkgver"
  echo $(pwd)
  npm run make-linux
}

package() {
  cd "$pkgname-$pkgver"
  echo $pkgdir
  cp -R out/hentaijs-linux-x64/* "$pkgdir/"
}
