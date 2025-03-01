# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='curd'
pkgver=1.1.1
pkgrel=1
pkgdesc="Watch anime in CLI with AniList Tracking, Discord RPC, Intro/Outro/Filler/Recap Skipping, etc."
arch=('x86_64')
url="https://github.com/Wraient/curd"
license=('GPL')
depends=('mpv' 'rofi' 'ueberzugpp')
provides=('curd')
conflicts=('curd')

pkgver() {
  curl -s "https://api.github.com/repos/Wraient/curd/releases/latest" | 
    jq -r '.tag_name' | sed 's/^v//'
}

build() {
  curl -L "https://github.com/Wraient/curd/releases/download/v$pkgver/curd-linux-x86_64" -o curd
  chmod +x curd
}

package() {
  install -Dm755 "$srcdir/curd" "$pkgdir/usr/bin/curd"
}
