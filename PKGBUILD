#Maintainer: VPeti1 (Vasko Peter) 

pkgname=flexpkg
pkgver=8
pkgrel=2
arch=('x86_64')

pkgdesc="A new to install programs"
license=('GPL3')

depends=('gcc' 'python3')

source=("https://github.com/VPeti1/CWAcces/raw/main/flexpkg.tar.gz")

sha256sums=('53b46e0ae028893a63019af4e06b19b79bb9cfd2497c842eb105ab3543a1ef09')

build() {
    sudo rm -rf /usr/flex/
    sudo rm -rf /bin/flex
    sudo rm -rf /usr/bin/flex
    sudo mkdir /usr/flex
    cd "$srcdir"
    sudo cp *.py /usr/flex
    g++ -o flexpkg run.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 flexpkg "$pkgdir/usr/bin/flex"
}


