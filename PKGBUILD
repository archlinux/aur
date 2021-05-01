# Maintainer: Elias Haddad <eliasynetto at gmail dot com>
_gitfolder="legion-y720-keyboard-backlight"
pkgname=legion-y720-keyboard-backlight-git
pkgver=1.0.r0.g01fab0b 
pkgrel=1
pkgdesc="Simple C program to control the keyboard backlight on the Lenovo Legion Y720"
arch=(x86_64)
url="https://github.com/threadexio/Legion-Y720-Keyboard-Backlight.git"
license=('MIT')
provides=(kbd-backlight)
conflicts=(kbd-backlight)
source=("${_gitfolder}::git+https://github.com/threadexio/Legion-Y720-Keyboard-Backlight.git")
md5sums=('SKIP')
depends=('libconfig')
makedepends=('git' 'ninja' 'gcc')

pkgver() {
  cd "${srcdir}/${_gitfolder}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_gitfolder}"
    make 
}

package() {
    cd "${srcdir}/${_gitfolder}"
    sudo make DESTDIR="$pkgdir/" install 
}




