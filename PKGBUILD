# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Max Bruckner (FSMaxB)
# Contributor: archtux <antonio dot arias99999 at gmail dot com>
pkgname=freac
pkgver=1.1.7
pkgrel=1
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=('x86_64')
url="https://www.freac.org"
license=('GPL-2.0-or-later')
depends=(
  'boca'
  'faac'
  'faad2'
  'hicolor-icon-theme'
  'lame'
  'libgudev'
  'libmp4v2'
  'libogg'
  'libpng'
  'libpulse'
  'libvorbis'
  'mpg123'
  'opus'
  'speex'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/enzo1982/freac/archive/v$pkgver.tar.gz")
sha256sums=('58f0353489b7cc4f42abc4f79dfce172312fd135c41181fa17344ed190cc47c4')

prepare() {
  cd "$pkgname-$pkgver"
  find . -type f -exec sed -i 's|/usr/local|/usr|g' {} \;
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
