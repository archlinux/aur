# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>
pkgname=alt-version-switcher
_pkgname=alt
pkgver=1.0.5
pkgrel=1
pkgdesc='Tool for switching between different versions of commands'
arch=('i686' 'x86_64')
url="https://github.com/dotboris/alt"
license=('MIT')
depends=()
conflicts=('alt' 'alt-git')
makedepends=('rust' 'cargo' 'git')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8b7cc468ccfd6fe131815bb205cac6fb5fe6ce2a23cb622284b25ae25b83feca3d8c91a8431fa53cdc69b89bd19feffb3b2730b418d27652e72880f203ed6889')

build() {
  cd "$_pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
