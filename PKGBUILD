# Maintainer: Lesnikov Vladimir <v.a.lesnikov@vk.com>
pkgname='pft'
pkgver='v0.4.1'
pkgrel=1
pkgdesc='TCP file sender/receiver'
arch=('x86_64' 'i686' 'pentium4' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/faceleft/pft'

license=('MIT')
makedepends=('go' 'git')

_tag=fc09bb1f38d8d38530d21f556fa55f5230c8b996 # git rev-parse "v$pkgver"
source=("git+https://github.com/faceleft/pft.git?signed#tag=$_tag")

sha256sums=('cc0899ea1618ec732826394e1f08ea3ef36497726536089a89877c3b93663637')

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
