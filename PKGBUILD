# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.12.3
pkgrel=1
arch=('x86_64' 'i686')
url=https://github.com/golangci/golangci-lint
license=('GPL3')
depends=()
makedepends=()
provides=('golangci-lint')
conflicts=('golangci' 'golangci-git')
if [[ $CARCH == "i686" ]]; then
    _dirname=${_pkgname}-${pkgver}-linux-386
else
    _dirname=${_pkgname}-${pkgver}-linux-amd64
fi
_source=${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux
source_x86_64=(${_source}-amd64.tar.gz)
sha512sums_x86_64=("0d77d4f955fb38dc2f27d12ab24f9b67fb53d3c6a50fd9c322396be2af7b84d7ccfcf3cb7b1a4d78dd637bd8d3544a7e5165c6847a97225046c436c22f68a88b")
source_i686=(${_source}-386.tar.gz)
sha512sums_i686=("9fae0a033b10a302d0ac2a378e5666da7c72c70c058d2148a439faf9037d7de53b7080e05aab88448160d2fdad096fc39d39707d7a1b859a2cb665b0f7e87fcb")

package() {
    install -Dm755 "$_dirname/golangci-lint" "$pkgdir/usr/bin/golangci-lint"
    install -Dm644 "$_dirname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
