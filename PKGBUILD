pkgname=flexpkg
pkgver=8
pkgrel=1
arch=('x86_64')

license=('GPL3')

depends=('gcc' 'python3')

source=("https://github.com/VPeti1/CWAcces/raw/main/flexpkg.tar.gz")

sha256sums=('a560babb66dfb67c6a6db3e7144323a866acfe371b2b76ecf6d9f02a7f3cec50')

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


