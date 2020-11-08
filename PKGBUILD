# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=gnome-games-libretro
_srcname=gnome-games
pkgver=3.38.0
pkgrel=1
pkgdesc='Libretro definitions for gnome-games'
arch=('any')
url='https://wiki.gnome.org/Apps/Games'
license=('GPL3')
optdepends=('libretro-blastem: Sega Mega Drive support'
            'libretro-bsnes-mercury-git: Super Nintendo Entertainment System support'
            #'libretro-desmume2015: Nintendo DS support'
            'libretro-desmume: Nintendo DS support'
            'libretro-dosbox-git: MS-DOS support'
            'libretro-gambatte: Nintendo Game Boy/Game Boy Color support'
            'libretro-handy-git: Atari Lynx support'
            'libretro-mame-git: Arcade support'
            'libretro-beetle-ngp-git: Neo Geo Pocket Color'
            'libretro-beetle-pce-fast: TurboGrafx support'
            'libretro-beetle-saturn-git: Sega Saturn support'
            'libretro-beetle-vb-git: Nintendo Virtual Boy support'
            'libretro-beetle-wswan-git: WonderSwan support'
            'libretro-mgba: Nintendo Game Boy Advance support'
            'libretro-nestopia: Nintendo Entertainment System support'
            'libretro-parallel-n64: Nintendo 64 support'
            'libretro-pcsx-rearmed-git: Sony PlayStation support'
            'libretro-picodrive: Sega Genesis/Master System/CD/32X/Pico support'
            'libretro-prboom-git: Doom support'
            'libretro-prosystem-git: Atari 7800 support'
            'libretro-stella2014-git: Atari 2600 support')
source=("https://download.gnome.org/sources/$_srcname/${pkgver%.*}/$_srcname-$pkgver.tar.xz")
sha256sums=('5c868fd6eb0b8d23b995039633043e90d8d93856d315832de3a315d7b1e54e48')

package() {
  cd "$_srcname-$pkgver"
  install -d "$pkgdir"/usr/lib/libretro/
  install -t "$pkgdir"/usr/lib/libretro/ flatpak/libretro-cores/*.libretro

  cp "$pkgdir"/usr/lib/libretro/desmume2015.libretro \
     "$pkgdir"/usr/lib/libretro/desmume.libretro
  sed -i 's/DeSmuME 2015/DeSmuME/;s/desmume2015/desmume/' \
    "$pkgdir"/usr/lib/libretro/desmume.libretro
}
