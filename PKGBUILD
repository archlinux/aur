# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=4.4
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('x86_64' 'aarch64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer' 'glibc')
makedepends=('cmake')
optdepends=('timidity++: for music playback')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha512sums=('df99887d72a407b03b5dc254337465a9a5da8402dc24ebad3781460651d23f80aa927d1415986e34d75b457c21f0941663ab1dcf1931421b1ef565dcc8bb9ee3')
b2sums=('c8f0ed3b6ea8c89fc294dd6376887df9521af45f5e222dbf840c8295f125e99b822fd5034fac83acc3c83224c5819973f0ec78f81f9a91a3f1f0938bbbac119d')

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
