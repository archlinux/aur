# Maintainer: gardar <aur@gardar.net>

pkgname=go-chroma
_binname=chroma
_pkgname=chroma
pkgver=2.15.0
pkgrel=1
pkgdesc="Chroma — A general purpose syntax highlighter in pure Go"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/alecthomas/chroma"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("${url}/archive/v$pkgver.tar.gz")
sha512sums=('5cb18bdb0f5f1be4054aa4946d6e66dba3d41d555f341e3decc68317c43c43dfb7888434f08ea54bd41eb5496a20f0b355074b476d6171306f0b69b1a9c01be4')

build() {
    cd $srcdir/$_pkgname-$pkgver/cmd/$_binname
    go build -o $_binname -ldflags "-s -w -X main.version=${pkgver}" 
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/cmd/${_binname}/${_binname}" "${pkgdir}/usr/bin/${_binname}"

}
