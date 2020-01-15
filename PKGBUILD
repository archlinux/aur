# Maintainer: gardar <aur@gardar.net>

pkgname=go-chroma
_binname=chroma
_pkgname=chroma
pkgver=0.7.1
pkgrel=1
pkgdesc="Chroma — A general purpose syntax highlighter in pure Go"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/alecthomas/chroma"
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("${url}/archive/v$pkgver.tar.gz")
sha256sums=('962d3f29a445b07ad86bb596f447d9dd572da5073ac99c10eef4066580aa1d26')


build() {
    cd $srcdir/$_pkgname-$pkgver/cmd/$_binname
    go build -o $_binname -ldflags "-s -w -X main.version=${pkgver}" 
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/cmd/${_binname}/${_binname}" "${pkgdir}/usr/bin/${_binname}"

}
