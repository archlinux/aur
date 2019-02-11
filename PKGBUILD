# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.14.0
pkgrel=1
arch=('x86_64' 'i686')
url=https://github.com/golangci/golangci-lint
license=('GPL3')
provides=('golangci-lint')
conflicts=('golangci-lint' 'golangci-lint-git')

_source=${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux
source_x86_64=(${_source}-amd64.tar.gz)
source_i686=(${_source}-386.tar.gz)
sha512sums_x86_64=('2356d58512f7a024987b2005a4ccf73dd2c11d5f07bfb41d4f6b6f738a69fe0cbad2cfb058be759e823d95210929f1924921c3ff4f84873edeb7490c2553ae60')
sha512sums_i686=('5be3b1c070664bf251453c6af656777c46bbb46331722686e99aa0c8d7c776919d8f79029895cce298373231c04f4ad4c780be5f31b1bac2ccd0b5e56c644a6f')

if [[ $CARCH == "i686" ]]; then
    _dirname=${_pkgname}-${pkgver}-linux-386
else
    _dirname=${_pkgname}-${pkgver}-linux-amd64
fi

package() {
    install -Dm755 "$_dirname/golangci-lint" "$pkgdir/usr/bin/golangci-lint"
}
