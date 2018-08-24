# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: frownlee <florez.brownlee@gmail.com>

pkgname=android-ndk
pkgver=r17.b
pkgrel=1
pkgdesc='Android C/C++ developer kit'
arch=('x86_64')
url='https://developer.android.com/ndk/'
license=('GPL' 'LGPL' 'custom')
options=('!strip' 'staticlibs')
backup=("etc/profile.d/$pkgname.sh")
install="$pkgname.install"
replaces=('android-ndk64')
depends=('ncurses5-compat-libs')
optdepends=(
  'python: various helper scripts'
)
source=("$pkgname.sh")
source_x86_64=("https://dl.google.com/android/repository/${pkgname}-${pkgver/./}-linux-x86_64.zip")
# SHA1 sums is kept to follow upstream releases https://github.com/android-ndk/ndk/issues/673
sha1sums=('2479a8d74428eb651ad2b9772ad655d7a90af410')
sha1sums_x86_64=('dd5762ee7ef4995ad04fe0c45a608c344d99ca9f')
sha256sums=('2068618bc3e99149310f544be5d639ae183dc767d5a7157a07d8e024417b6017')
sha256sums_x86_64=('5dfbbdc2d3ba859fed90d0e978af87c71a91a5be1f6e1c40ba697503d48ccecd')

package() {
  install -d "$pkgdir/opt"
  mv "$pkgname-${pkgver/./}" "$pkgdir/opt/$pkgname"

  install -Dm755 $pkgname.sh "$pkgdir/etc/profile.d/$pkgname.sh"
}

# vim: set ts=2 sw=2 et ft=sh:
