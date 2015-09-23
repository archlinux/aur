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
    install -D ../gpio_halt.sh "${pkgdir}/usr/bin/gpio_halt"
    install -D ../gpio_halt.service "${pkgdir}/etc/systemd/system/gpio_halt.service"
    
    #systemctl daemon-reload
    #systemctl enable gpio_halt.service

    echo "=="
    echo "== This package defaults to gpio pin 4 (header 7) and ground."
    echo "== If you choose a different pin, edit /usr/bin/gpio_halt"
    echo "=="
    echo "== Make sure the spst switch is connected from ground to the"
    echo "== specified header. Then continue:"
    echo "=="
    echo "== The service is not active, make sure to run:"
    echo "== $ systemctl daemon-reload"
    echo "== $ systemctl enable gpio_halt.service"
    echo "=="
    echo "== Holding the button for >=6 seconds and releasing will then"
    echo "== cause the system to safely shutdown."
    echo "=="
}

