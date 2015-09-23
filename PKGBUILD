# Maintainer: Christopher Bero <bigbero@gmail.com>
pkgname=wiringpi-gpio-halt
pkgver=0.1
pkgrel=1
pkgdesc="GPIO interrupt driven shutdown for RaspberryPi."
arch=('armv7h' 'armv6h' 'i686' 'x86_64')
url="http://crompton.com/hamradio/RPi2_halt_switch/"
license=('GPL')
#groups=()
depends=('wiringpi-git')
#makedepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
#source=($pkgname-$pkgver.tar.gz)
#noextract=()
md5sums=() #autofill using updpkgsums

#build() {
    # Shell script, no building
#}

package() {
    cp gpio_halt.sh /usr/bin/gpio_halt
    cp gpio_halt.service /etc/systemd/system/gpio_halt.service
    
    systemctl daemon-reload
    #systemctl enable gpio_halt.service

    echo "=="
    echo "== This package defaults to gpio pin 4 (header 7) and ground."
    echo "== If you choose a different pin, edit /usr/bin/gpio_halt"
    echo "=="
    echo "== The service is not active, make sure to run:"
    echo "== systemctl daemon-reload"
    echo "== systemctl enable gpio_halt.service"
    echo "=="
}

