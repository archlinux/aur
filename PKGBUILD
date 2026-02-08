# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>
# Maintainer: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=azd-cli
_pkgname=azure-dev
pkgver=1.23.3
pkgrel=1
pkgdesc='A developer CLI for working with Azure resources to build and deploy AI applications'
arch=('x86_64' 'aarch64')
url="https://github.com/Azure/azure-dev"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('azd')

source=("LICENSE")
source_x86_64=("https://github.com/azure/${_pkgname}/releases/download/${_pkgname}-cli_${pkgver}/azd-linux-amd64.tar.gz")
source_aarch64=("https://github.com/azure/${_pkgname}/releases/download/${_pkgname}-cli_${pkgver}/azd-linux-arm64.tar.gz")

sha256sums=('24341ac14899292f68659fbd52b6dd4453cd1b304f43ef9f9cc4e8aa77e81f51')
sha256sums_x86_64=('3b43af79e7a6a814ae47e9b07edc2de45338c195036b69db6373ed0f905cbf99')
sha256sums_aarch64=('7de3753b7ba9ecfdb6ba70859367303b70713088e63e7c530a3c48f8de508b24')

package() {
    #install -Dm755 azd "$pkgdir/usr/bin/azd"
     #install -Dm755 "$srcdir/azd-linux-$CARCH" "$pkgdir/usr/bin/azd"
     if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 azd-linux-amd64 "$pkgdir/usr/bin/azd"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 azd-linux-arm64 "$pkgdir/usr/bin/azd"
    fi
}