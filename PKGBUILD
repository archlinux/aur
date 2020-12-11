# Maintainer: Avery Murray <averylapine@gmail.com>

_pkgname=proton-call
pkgname=proton-caller
__pkgname=Proton-Caller
pkgver=1.3.2
pkgrel=1
pkgdesc="Run any Windows program through Proton"
arch=('x86_64')
url="https://github.com/caverym/Proton-Caller/"
license=('GPL3')
depends=(
  'steam'
  'dxvk'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/caverym/"$__pkgname"/archive/${pkgver}.tar.gz")
sha256sums=('59284eafb1760fe2279c44a10e8e8144dfc562821e49e58e7fd0a4636f0d1924')

build() {
  cd "$srcdir/$__pkgname-$pkgver"
  make
}

package() {
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/licenses/"$_pkgname"/
  mkdir -p "$pkgdir"/usr/share/man/man6/
  mkdir -p "$pkgdir"/usr/share/proton-caller/
  cp -f "$srcdir/$__pkgname-$pkgver"/LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/
  install -g 0 -o 0 -m 0644 "$srcdir/$__pkgname-$pkgver"/manual/"$_pkgname".6 "$pkgdir"/usr/share/man/man6/
  cp "$srcdir/$__pkgname-$pkgver"/"$_pkgname" "$pkgdir"/usr/bin/
  cp "$srcdir/$__pkgname-$pkgver"/HELP "$pkgdir"/usr/share/proton-caller/
}
