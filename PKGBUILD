# Maintainer: gardar <aur@gardar.net>

pkgname=go-chroma
_binname=chroma
_pkgname=chroma
pkgver=2.7.0
pkgrel=1
pkgdesc="Chroma — A general purpose syntax highlighter in pure Go"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/alecthomas/chroma"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("${url}/archive/v$pkgver.tar.gz")
sha256sums=('9d5d1f5ff7f91aff97b9eb7921e3540c863b5f01197b99a1362e777f7b43e215')

build() {
    cd $srcdir/$_pkgname-$pkgver/cmd/$_binname
    go build -o $_binname -ldflags "-s -w -X main.version=${pkgver}" 
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/cmd/${_binname}/${_binname}" "${pkgdir}/usr/bin/${_binname}"

}
