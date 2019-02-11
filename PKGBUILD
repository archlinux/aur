# Maintainer: William Gathoye <william + aur at gathoye dot be>

pkgname=plasma5-applets-netspeed
pkgver=1.6
pkgrel=1
pkgdesc='Plasma 5 widget that displays the currently used network bandwidth'
arch=('i686' 'x86_64')

url='https://github.com/dfaust/plasma-applet-netspeed-widget'
license=('GPL2')

makedepends=('git' 'cmake' 'extra-cmake-modules' 'plasma-framework')

source=(
    "https://github.com/dfaust/plasma-applet-netspeed-widget/archive/v${pkgver}.tar.gz"
)
sha512sums=(
    'c13486a7b9fdcfc898caebbb3c039b9cffce89103187f4d86f0a3ffae200636707c707f200b76ae513c0ed4f431b0fabfa8f3b7a98cbd857e9c5e8875966afe8'
)

build() {
    cd "plasma-applet-netspeed-widget-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr 
    make
}

package() {
    cd "plasma-applet-netspeed-widget-${pkgver}"
    make DESTDIR="$pkgdir/" install
}

