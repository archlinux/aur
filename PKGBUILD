# Maintainer: Avery Murray <averylapine@gmail.com>

_pkgname=proton-call
pkgname=proton-caller
__pkgname=Proton-Caller
pkgver=1.0.3
pkgrel=2
pkgdesc="Run any Windows program through Proton"
arch=('x86_64')
url="https://github.com/caverym/Proton-Caller/"
license=('GPL3')
depends=(
  'steam'
  'dxvk'
)
source=("https://github.com/caverym/"$__pkgname"/archive/${pkgver}.tar.gz")
sha256sums=('a70e30bfe47565cb436ff5ea846eefe25e9da7446af4c5062864ecd1001d2c1d')

build() {
  cd "$srcdir/$__pkgname-$pkgver"
    g++ -o "$_pkgname" main.cpp
}

package() {
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/licenses/"$_pkgname"/
  mkdir -p "$pkgdir"/usr/share/man/man6/
  cp -f "$srcdir/$__pkgname-$pkgver"/LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/
  install -g 0 -o 0 -m 0644 "$srcdir/$__pkgname-$pkgver"/"$_pkgname".6 "$pkgdir"/usr/share/man/man6/
  gzip -f "$pkgdir"/usr/share/man/man6/"$_pkgname".6
  cp "$srcdir/$__pkgname-$pkgver"/"$_pkgname" "$pkgdir"/usr/bin
}
