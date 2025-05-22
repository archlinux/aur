# Maintainer: LilBroCodes <lilbrocodes@gmail.com>
pkgname=hydra-js
pkgver=1.2.6
pkgrel=1
pkgdesc='"Modding" framework for compiled / obfuscated JavasScript'
arch=('x86_64')
url="https://github.com/LilBroCodes/hydra"
license=('custom:CC-BY-NC-SA')
depends=('nodejs')
makedepends=('npm')
source=("https://github.com/LilBroCodes/hydra/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('456fc77cd150b5218ac83d296a193c5ef9828e19b3e74b9a437231a4f6e7cc65')
options=(!strip)

build() {
  cd "$srcdir/hydra-$pkgver"

  npm install
  npm run bundle:linux
}

package() {
  cd "$srcdir/hydra-$pkgver"

  install -Dm755 "build/hydra-linux" "$pkgdir/usr/bin/hydra"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
