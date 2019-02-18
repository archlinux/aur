# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.15.0
pkgrel=1
arch=('x86_64' 'i686')
url=https://github.com/golangci/golangci-lint
license=('GPL3')
provides=('golangci-lint')
conflicts=('golangci-lint' 'golangci-lint-git')

_source=${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux
source_x86_64=(${_source}-amd64.tar.gz)
source_i686=(${_source}-386.tar.gz)
sha512sums_x86_64=('43375be5dc3400c2b889bf68b903e626f67c1a32da1f9aec80173c9bad94bec4cda45db14cadeeccb1c8a312eb5749219cdf053fdf6fe5c3ecb44997cdb666d7')
sha512sums_i686=('90f1a28c542d99cdbbd9835e827f4636012d1f52082659a4ed12d2d4ca5699d550e0f79a0def533ba69818e61783c08bc317bf01cc71300604ac88b9c4824422')

if [[ $CARCH == "i686" ]]; then
    _dirname=${_pkgname}-${pkgver}-linux-386
else
    _dirname=${_pkgname}-${pkgver}-linux-amd64
fi

package() {
    install -Dm755 "$_dirname/golangci-lint" "$pkgdir/usr/bin/golangci-lint"
}
