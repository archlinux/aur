# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=gnome-games-libretro
_srcname=gnome-games
pkgver=3.36.0
pkgrel=1
pkgdesc='Libretro definitions for gnome-games'
arch=('any')
url='https://wiki.gnome.org/Apps/Games'
license=('GPL3')
makedepends=('git')
optdepends=('libretro-blastem: Sega Mega Drive support'
            'libretro-bsnes-mercury-git: Super Nintendo Entertainment System support'
            # TODO: see if renaming module to desmume works
            #'libretro-desmume2015: Nintendo DS support'
            'libretro-dosbox-git: MS-DOS support'
            'libretro-gambatte: Nintendo Game Boy/Game Boy Color support'
            'libretro-handy-git: Atari Lynx support'
            'libretro-mame-git: Arcade support'
            # TODO: see if renaming module to beetle works
            #'libretro-mednafen-ngp: Neo Geo Pocket Color'
            #'libretro-mednafen-pce-fast: TurboGrafx support'
            #'libretro-mednafen-saturn-git: Sega Saturn support'
            #'libretro-mednafen-vb: Nintendo Virtual Boy support'
            #'libretro-mednafen-wswan: WonderSwan support'
            'libretro-mgba: Nintendo Game Boy Advance support'
            'libretro-nestopia: Nintendo Entertainment System support'
            'libretro-pcsx-rearmed-git: Sony PlayStation support'
            'libretro-picodrive: Sega Genesis/Master System/CD/32X/Pico support'
            # Missing package
            #'libretro-prboom: Doom support'
            'libretro-prosystem-git: Atari 7800 support'
            'libretro-stella2014-git: Atari 2600 support')
# libretro-cores is export-ignore in .gitattributes
source=("git+https://gitlab.gnome.org/GNOME/$_srcname.git#tag=$pkgver")
sha256sums=('SKIP')

package() {
  cd "$_srcname"
  install -d "$pkgdir"/usr/lib/libretro/
  install -t "$pkgdir"/usr/lib/libretro/ flatpak/libretro-cores/*.libretro
}
