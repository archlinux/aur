# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=s25rttr-nightly-bin
pkgver=20170309
pkgrel=1
pkgdesc="Settlers II remake (Needs a copy of the original game!)"
arch=('x86_64')
url="http://www.siedler25.org/"
license=('GPL3')
depends=(sdl sdl_mixer)
install="s25rttr-nightly-bin.install"
source=("http://www.siedler25.org/uploads/nightly/s25rttr_20170309-bf9fcc601ed2de847ea26aecec6e15cd92f8357e_linux.x86_64.tar.bz2"
        "rttr"
        "s25rttr-nightly-bin.install")
sha256sums=('fc6f4e15d4eb42ceb22e6b976d7e486426bd3b894aa7964ec506e541e237c306'
            '985b0e88823e3b7d525cedfb602bb249217dc0e5271223b2a810ef37c1908fdb'
            '774aaaafc556ccd3334ee0129267382117ec5e178095377a4676cbcf00845489')

build() {
  cd "$srcdir"/s25rttr_"$pkgver"
  rm lib/libminiupnpc.so
}

package() {
  cd "$srcdir"/s25rttr_"$pkgver"
  install -d "$pkgdir"/usr
  cp -r lib/ share/ "$pkgdir"/usr/
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/lib/s25rttr
  install -m755 bin/s25client "$pkgdir"/usr/lib/s25rttr/
  install -m755 ../rttr "$pkgdir"/usr/bin/
}

# vim:set ts=2 sw=2 et:
