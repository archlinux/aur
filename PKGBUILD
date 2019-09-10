# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.18.0
pkgrel=1
arch=('x86_64' 'i686')
url=https://github.com/golangci/golangci-lint
license=('GPL3')
provides=('golangci-lint')
conflicts=('golangci-lint' 'golangci-lint-git')

_source=${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux
source_x86_64=(${_source}-amd64.tar.gz)
source_i686=(${_source}-386.tar.gz)
sha512sums_x86_64=('38265fe573fb405319fb0fc68177db4cb84a929f9065540cfff487030d5d15c923a7d593f135326c8820dccad8bb1d365475c62deba0a128234c678c0c049646')
sha512sums_i686=('5d08850e599325dbd99099d983545ebabb857447a1697cca9ecafe71d176499cafd426e475bcdeb4639d88caef627bbeec5c25433866592dfd4ab4b938eda3c5')

if [[ $CARCH == "i686" ]]; then
    _dirname=${_pkgname}-${pkgver}-linux-386
else
    _dirname=${_pkgname}-${pkgver}-linux-amd64
fi

package() {
    install -Dm755 "$_dirname/golangci-lint" "$pkgdir/usr/bin/golangci-lint"
}
