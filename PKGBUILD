# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=lutris-git
pkgver=0.3.6.2.r161.be2ab37
pkgrel=1
pkgdesc='Open Gaming Platform'
arch=('any')
url='http://lutris.net/'
license=('GPL3')
depends=('desktop-file-utils' 'glib-networking' 'gvfs' 'hicolor-icon-theme'
         'polkit' 'python2-gobject' 'python2-xdg' 'python2-yaml' 'xorg-xrandr')
makedepends=('git' 'python2-setuptools')
optdepends=('atari800: Atari 800/800XL/130XE/5200 Emulator'
            'dolphin-emu: Nintendo Gamecube/Wii/Triforce Emulator'
            'dosbox: DOS Emulator'
            'frotz: Z-machine Interpreter'
            'fs-uae: Amiga Emulator'
            'gens-gs: Sega Genesis/CD/32X Emulator'
            'hatari: Atari ST/STE Emulator'
            'jzintv: Matel Intellivision Emulator'
            'mednafen: Multi-system Emulator'
            'mupen64plus: Nintendo 64 Emulator'
            'o2em: Magnavox Odyssey 2 Emulator'
            'openmsx: MSX Emulator'
            'osmose: Sega Master System/Gamegear Emulator'
            'pcsxr: Sony Playstation emulator'
            'residualvm: 3D Point and Click Virtual Machine'
            'scummvm: 2D Point and Click Virtual Machine'
            'sdlmame: Multiple Arcade Machine Emulator'
            'snes9x-gtk: Super Nintendo Emulator'
            'steam: Digital Gaming Platform'
            'stella: Atari 2600 Emlator'
            'vice: Commodore 64 Emulator'
            'virtualjaguar: Atari Jaguar Emulator'
            'wine: Windows Compatibility Layer')
provides=('lutris')
conflicts=('lutris')
install='lutris.install'
source=('git+https://github.com/lutris/lutris.git')
sha256sums=('SKIP')

pkgver() {
  cd lutris

  printf "%s" "$(git describe | sed 's/v//; s/-/.r/; s/-g/./')"
}

prepare() {
  cd lutris

  sed -i 's|^#!.*python$|#!/usr/bin/python2|' $(grep -rl '^#!.*python')
}

package() {
  cd lutris

  python2 setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
