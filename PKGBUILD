# Maintainer: gardar <aur@gardar.net>

pkgname=go-chroma
_binname=chroma
_pkgname=chroma
pkgver=0.10.0
pkgrel=1
pkgdesc="Chroma — A general purpose syntax highlighter in pure Go"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/alecthomas/chroma"
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("${url}/archive/v$pkgver.tar.gz")
sha256sums=('98a517ae99f48e3b54d5c8cd7473d5c544f51bee7a4be17f5175736fce37da56')


build() {
    cd $srcdir/$_pkgname-$pkgver/cmd/$_binname
    go build -o $_binname -ldflags "-s -w -X main.version=${pkgver}" 
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/cmd/${_binname}/${_binname}" "${pkgdir}/usr/bin/${_binname}"

}
