# Maintainer: Benjamin Hedrich <code at pagenotfound.de>
pkgname=raspberry-remote-git
_gitname=raspberry-remote
pkgver=70.8a5b705
pkgrel=1
pkgdesc="Control remote plugs with the Raspberry Pi, features a webinterface. Uses RCSwitch and wiringPi."
url="https://github.com/xkonni/raspberry-remote"
arch=('armv7h' 'armv6h' 'i686' 'x86_64')
license=('GPL2')
depends=('wiringpi-git')
makedepends=('git')
source=('git://github.com/xkonni/raspberry-remote')
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd $_gitname
    make send
}

package() {
    cd $_gitname
    install -D send "${pkgdir}"/usr/bin/send
}
