# Maintainer: Fancy Zhang <springzfx@gmail.com>
pkgbase=cgproxy
pkgname=cgproxy
pkgver=4.0
pkgrel=1
pkgdesc="A transparent proxy program with cgroup2, like proxychains"
arch=('x86_64')
url="https://github.com/springzfx/cgproxy"
license=('')
groups=('')
makedepends=('cmake')
depends=('systemd')
options=('!strip' '!emptydirs')
# source_x86_64=("cgproxy.tar.gz")
source_x86_64=("https://github.com/springzfx/cgproxy/archive/v$pkgver.tar.gz")
md5sums_x86_64=('4a20feabb7181ce6ff4fbe5a76c056d1')

backup=('etc/cgproxy.conf')

build(){
    cd ${srcdir}/$pkgname-$pkgver
    mkdir -p build && cd build && cmake .. && make 
}
package_cgproxy(){
    cd ${srcdir}/$pkgname-$pkgver/build
    make DESTDIR=$pkgdir install 
}

