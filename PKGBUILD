# Maintainer: dtluna <dtluna@riseup.net>

pkgname=go-arc
_binname=arc
_pkgname=archiver
pkgver=3.2.0
pkgrel=2
pkgdesc="Easily create and extract .zip, .tar, .tar.gz, .tar.bz2, .tar.xz, and .rar (extract-only) files with Go"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/mholt/archiver"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=("${url}/archive/v$pkgver.tar.gz")
sha256sums=('919182c8a2ae8095b12f059a1b2826107629bd13bdba6a429cb3d97eac6ae065')


build() {
    cd $srcdir/$_pkgname-$pkgver/cmd/$_binname
    go build -o $_binname
}

package() {
    # Bin
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/cmd/${_binname}/${_binname}" "${pkgdir}/usr/bin/${_binname}"

    # License
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
