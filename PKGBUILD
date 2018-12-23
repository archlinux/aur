# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.12.5
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
sha512sums_x86_64=('febd2302897e005cd468deffac79c6bc142d7a3878743b38f41a6d5aa94398bccdba493cffb0a915859931c482bc494d93ff1ca1db498c6eba964bfb7bd27e91')
sha512sums_i686=('133994131fbfcbb273847a5f04cc8c70e5fbfb72a320a68fd8e15f0c4187e9804cb2b37fa35749ab2dfc9524b5570f021b894d661cbb1f8f4ddac48b57d6009b')
source_i686=(${_source}-386.tar.gz)

package() {
    install -Dm755 "$_dirname/golangci-lint" "$pkgdir/usr/bin/golangci-lint"
    install -Dm644 "$_dirname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
