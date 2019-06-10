# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.17.1
pkgrel=1
arch=('x86_64' 'i686')
url=https://github.com/golangci/golangci-lint
license=('GPL3')
provides=('golangci-lint')
conflicts=('golangci-lint' 'golangci-lint-git')

_source=${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux
source_x86_64=(${_source}-amd64.tar.gz)
source_i686=(${_source}-386.tar.gz)
sha512sums_x86_64=('b54129991c4831ed69ab4d1bfab1723a2b80c8495ad25a3d10a2afcc273a3ce69a276573e0fefbad471f9a1c2fb5e1a88316f71cd1e607a76e57a862aedfbbda')
sha512sums_i686=('c2bce4a10fb8b62fec20b2cc77c030eb83d931ef55f58086a6c837a68d9b7eb51210be35a950a7e5716bdb941120a64f9602f5c1dad848f34edb8b8d2289472c')

if [[ $CARCH == "i686" ]]; then
    _dirname=${_pkgname}-${pkgver}-linux-386
else
    _dirname=${_pkgname}-${pkgver}-linux-amd64
fi

package() {
    install -Dm755 "$_dirname/golangci-lint" "$pkgdir/usr/bin/golangci-lint"
}
