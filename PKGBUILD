# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>
pkgname=alt-version-switcher
_pkgname=alt
pkgver=1.0.2
pkgrel=1
pkgdesc=''
arch=('i686' 'x86_64')
url="https://github.com/dotboris/alt"
license=('MIT')
depends=()
conflicts=('alt' 'alt-git')
makedepends=('rust' 'cargo' 'git')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fb1ff6699d5abd085bea3dc67b8a75aa2c43bc5718c2861bca23cbb5a12dc31006f0591ddb559ff1f3ac3e66ff3a3c18c5030ad1633213a6abbd58d6e53a5efc')

build() {
  cd "$_pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
