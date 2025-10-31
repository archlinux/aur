# Maintainer: NikzoOff <joane.seguin23@gmail.com>
pkgname=did-i-break-it
pkgver=0.1.0
pkgrel=1
pkgdesc="Dibi or 'Did-I-Break-It' is a simple snapshot tool written in C. It will create a .DIBI file in your $HOME directory and a snapshot directory. It'll run basic tests and compare them."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/NikzoOff/DIBI"
license=('MIT') 
depends=('glibc' 'systemd') 
makedepends=('git' 'gcc' 'make')  
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a7beeb0161dc599ccc044c211dd51161d3a86cb49cfe0b38bfb72636f3db6503') 

build() {
    cd "DIBI-$pkgver"
    make
}

package() {
    cd "DIBI-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir/" install
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
