#Maintainer: VPeti1 (Vasko Peter) 

pkgname=cwplus
pkgver=1
pkgrel=1
arch=('x86_64')

license=('GPL2')
pkgdesc="The GUI version of OpenCW/CW-I"

depends=('gcc' 'python3')

source=("https://github.com/VPeti1/CWAcces/raw/main/cwplus.tar.gz")

sha256sums=('39abd6efeede6791f5664913e1eaedcfa5a91a6d94c508b5b581c098d11f41b6')

build() {
    sudo rm -rf /usr/cw/
    sudo rm -rf /bin/cwplus
    sudo mkdir /usr/cw
    cd "$srcdir"
    sudo cp *.py /usr/cw
    g++ -o cwplus run.cpp
}

package() {
    cd "$srcdir"
    install -Dm755 cwplus "$pkgdir/usr/bin/cwplus"
}


