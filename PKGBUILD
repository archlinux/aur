# Maintainer: Lesnikov Vladimir <v.a.lesnikov@vk.com>
pkgname='pft'
pkgver='v0.4.1'
pkgrel=1
pkgdesc='TCP file sender/receiver'
arch=('x86_64' 'i686' 'pentium4' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/faceleft/pft'

license=('MIT')
makedepends=('go' 'git')

_tag=d6e33d91132d96f50b62c8ac025ff0e8ba935877 # git rev-parse "v$pkgver"
source=("git+https://github.com/faceleft/pft.git?signed#tag=$_tag")

sha256sums=('6d305a97da488d2053b20bd2d96cd6db09cff5053ac95326b8d991aaa4a4c2ce')

pkgver() {
	cd "$pkgname"
    git describe
}

build() {
	cd "$pkgname"
    CGO_ENABLED=0 go build
}

package() {
	cd "$pkgname"
    mkdir -p $pkgdir/usr/bin
    cp pft $pkgdir/usr/bin 
}
