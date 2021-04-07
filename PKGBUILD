# Maintainer: tejonaco

pkgname=mazda-aio-tweaks
pkgver=2.8.6
pkgrel=1
pkgdesc='Mazda AIO Tweaks'
arch=('x86_64' 'i686')
source=("mzd.deb::https://github.com/Trevelopment/MZD-AIO/releases/download/v$pkgver/MZD-AIO-TI-linux_$pkgver.deb")
license=('GLP')
url='https://mazdatweaks.com/'
makedepends=('curl')
md5sums=("SKIP")

pkgver(){
    curl -sLI deb.mazdatweaks.win | grep -Po '(?<=linux_).+(?=\.deb)' | sed -n 1p
}

prepare(){
    echo 'Extracting files...'
    ar x mzd.deb
    mkdir pkg
    tar -xf data.tar.xz -C pkg 
    echo 'Done'
}

package(){
    cp -r pkg/* $pkgdir
}
