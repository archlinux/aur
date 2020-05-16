# Maintainer: Fancy Zhang <springzfx@gmail.com>
pkgname=cgproxy
pkgver=v4.0
pkgrel=1
pkgdesc="A transparent proxy program with cgroup2, like proxychains"
arch=('x86_64')
url="https://github.com/springzfx/cgproxy"
license=('GPL')
groups=('')
makedepends=('cmake')
depends=('systemd' 'nlohmann-json')
provides=('cgproxy')
conflicts=('cgproxy')

source=("${pkgname}::git+https://github.com/springzfx/cgproxy#tag=${pkgver}")
md5sums=('SKIP')

backup=('etc/cgproxy/config.json')
install='cgproxy.install'

build(){
    cd "$pkgname"
    mkdir -p build && cd build && cmake .. && make 
}

package_cgproxy(){
    cd "$pkgname"/build
    make DESTDIR=$pkgdir install 
}

