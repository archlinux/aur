# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.19.0
pkgrel=1
arch=('x86_64' 'i686' 'aarch64')
url=https://github.com/golangci/golangci-lint
license=('GPL3')
provides=('golangci-lint')
conflicts=('golangci-lint' 'golangci-lint-git')

_source=${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux
source_x86_64=(${_source}-amd64.tar.gz)
source_i686=(${_source}-386.tar.gz)
source_aarch64=(${_source}-arm64.tar.gz)
sha512sums_x86_64=('65a71890ca5731567f68e399690ae55454c35e35b0299162469ac80145084e6ead801648d528410d3d76ff9b63289f5a518bbebce90252a147e9ae45a7333cff')
sha512sums_i686=('c6efd5fcd64440be1c1482ba4d6470ae46c43cd76350d93e8ab5b7c6de2138bfeefa998e2de126fdc513d75c93d7382be5285f003ee5cb29b2d05611a6748d04')
sha512sums_aarch64=('0c9bf8f00fe8e95dc02365ce7094c7bd2a590fc444a92563cf21e4bcd5a11d0740844a27cc0ce885bf4a50e55b8a183ac4b4d2a040ed2b7a000aac9965ca1e3a')

if [[ $CARCH == "i686" ]]; then
    _dirname=${_pkgname}-${pkgver}-linux-386
elif [[ $CARCH == "aarch64" ]]; then
    _dirname=${_pkgname}-${pkgver}-linux-arm64
else
    _dirname=${_pkgname}-${pkgver}-linux-amd64
fi

package() {
    install -Dm755 "$_dirname/golangci-lint" "$pkgdir/usr/bin/golangci-lint"
}
