# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=ponymix
pkgver=5
pkgrel=4
pkgdesc="CLI PulseAudio Volume Control"
arch=('x86_64' 'aarch64')
url="https://github.com/falconindy/ponymix"
license=('MIT')
depends=('pulseaudio' 'libnotify')
source=(https://pkgbuild.com/~dreisner/sources/ponymix/ponymix-5.tar.xz{,.sig})
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53')
md5sums=('ac44f2224bb6e694673ed0498b07fec8'
         'SKIP')

build() {
  make -C "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ft=sh syn=sh et
