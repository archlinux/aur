#Author: Schrottfresse

pkgname=arduino-adafruitst7735library-git
pkgver=1.2.5.r3.g75c67ea
pkgrel=1
pkgdesc="A library for Adafruit tft displays."
arch=('any')
url="https://github.com/adafruit/Adafruit-ST7735-Library"
license=('MIT')
optdepends=('arduino')
makedepends=('git')
source=('git+https://github.com/adafruit/Adafruit-ST7735-Library.git')
md5sums=('SKIP')

_gitname="Adafruit-ST7735-Library"
_futurefoldername="Adafruit-ST7735"

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -dm755 "$pkgdir/usr/share/arduino/libraries/$_futurefoldername"
  install -dm755 "$pkgdir/usr/share/arduino/examples/$_futurefoldername"

  cp "$_gitname/Adafruit_ST7735.cpp" "$pkgdir/usr/share/arduino/libraries/$_futurefoldername"
  cp "$_gitname/Adafruit_ST7735.h" "$pkgdir/usr/share/arduino/libraries/$_futurefoldername"
  cp "$_gitname/README.txt" "$pkgdir/usr/share/arduino/libraries/$_futurefoldername"
  chmod 755 "$pkgdir/usr/share/arduino/libraries/$_futurefoldername/" -R

  cp -r "$_gitname/examples/." "$pkgdir/usr/share/arduino/examples/$_futurefoldername"
  chmod 755 "$pkgdir/usr/share/arduino/examples/$_futurefoldername/" -R
}
