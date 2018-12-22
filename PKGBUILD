# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.12.4
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
sha512sums_x86_64=('d2da5815fd350acfa2673305f3b0b49524ea9ca8b922d24e90960770c299712db29d310f4bced8b95ce1edb1527fe5d25948f8a8dd760e44529c5373d68122ef')
sha512sums_i686=('2544e61952ec0edfb51c424f97dfa071234dddecfb82083f96fcb40fc142b176087d79c7e4f587d43670f3b3b146d9b4ea97d960e152c1051a66679aa5ffd354')
source_i686=(${_source}-386.tar.gz)

package() {
    install -Dm755 "$_dirname/golangci-lint" "$pkgdir/usr/bin/golangci-lint"
    install -Dm644 "$_dirname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
