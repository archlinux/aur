# Maintainer: Fancy Zhang <springzfx@gmail.com>
pkgbase=cgproxy
pkgname=cgproxy
pkgver=3.2.3
pkgrel=1
pkgdesc="A transparent proxy program with cgroup2, like proxychains"
arch=('x86_64')
url="https://github.com/springzfx/cgproxy"
license=('')
groups=('')
makedepends=('cmake')
depends=()
options=('!strip' '!emptydirs')
# source_x86_64=("cgproxy.tar.gz")
source_x86_64=("https://github.com/springzfx/cgproxy/archive/v$pkgver.tar.gz")
md5sums_x86_64=('40e7dc06b44c70dac254db8a5e9ad9e9')

backup=('etc/cgproxy.conf')

build(){
    cd ${srcdir}/$pkgname-$pkgver
    mkdir -p build && cd build && cmake .. && make 
}
package_cgproxy(){
    cd ${srcdir}/$pkgname-$pkgver/build
    make DESTDIR=$pkgdir install 
}

