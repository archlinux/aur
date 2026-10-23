# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=proton-pass-cli-bin
pkgver=2.5.0 # datasource=github-releases depName=protonpass/pass-cli
pkgrel=1
pkgdesc='A command-line interface for managing your Proton Pass vaults, items, and secrets.'
arch=('aarch64' 'x86_64')
url='https://protonpass.github.io/pass-cli/'
depends=('glibc' 'libgcc')
license=('GPL-3.0-or-later')

_downloadUrl="https://github.com/protonpass/pass-cli/releases/download/${pkgver}"

source_aarch64=("pass-cli-aarch64-${pkgver}::${_downloadUrl}/pass-cli-linux-aarch64")
source_x86_64=("pass-cli-x86_64-${pkgver}::${_downloadUrl}/pass-cli-linux-x86_64")

sha256sums_aarch64=('052f131d8d071d36097fea084c7e5823358ad0ad8ab41195e6348fc10ec8192c')
sha256sums_x86_64=('9ce925d06407097337a01502f281d63a8bed80b7c54b96942dd665d4eb488cfd')

package() {
	install -Dm755 "pass-cli-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/pass-cli"
}
