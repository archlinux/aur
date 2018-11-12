# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.12.2
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
sha512sums_x86_64=("5a87b38c06ce3abc185a3f0480301d62949cf92779634725e89fc7d8595d5bc186fb8cdc9e694b1e91e57d58ab6bfe286bbfc51d6af5b52b7c5ae339746013af")
source_i686=(${_source}-386.tar.gz)
sha512sums_i686=("20abbf020752d672e979256207033d27398f26736414e1c8aea03b0e7060b20077b47275bb5b00bbd194bd15763848d2b28299ef0687a4628feb291cb7231c50")

package() {
    install -Dm755 "$_dirname/golangci-lint" "$pkgdir/usr/bin/golangci-lint"
    install -Dm644 "$_dirname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
