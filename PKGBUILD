# Maintainer: Ryein Goddard <ryein at live dot com>
pkgname=plaid-cli
_pkgver=20260507-4d1b0ca0
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='CLI for the Plaid API'
arch=('x86_64' 'aarch64')
url='https://plaid.com/docs/resources/cli/'
license=('LicenseRef-Plaid')
options=('!strip' '!debug')
provides=('plaid')
source_x86_64=("https://releases.plaid.com/plaid-cli/releases/${_pkgver}/plaid-cli_${_pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://releases.plaid.com/plaid-cli/releases/${_pkgver}/plaid-cli_${_pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6f8c13d16bdadb7e171920891eb148b1d7494ae76511ac20e37e79f2bf110fa5')
sha256sums_aarch64=('ac3b5c2bd39ef34dc61872aa0a3b86a0581526860f9c1a9bc5006fc3665178bf')

check() {
  "$srcdir/plaid" --version | grep -Fq "$_pkgver"
}

package() {
  install -Dm755 plaid "$pkgdir/usr/bin/plaid"
}
