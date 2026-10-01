# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=proton-pass-cli-bin
pkgver=2.4.2 # datasource=github-releases depName=protonpass/pass-cli
pkgrel=1
pkgdesc='A command-line interface for managing your Proton Pass vaults, items, and secrets.'
arch=('aarch64' 'x86_64')
url='https://protonpass.github.io/pass-cli/'
depends=('glibc' 'libgcc')
license=('GPL-3.0-or-later')

_downloadUrl="https://github.com/protonpass/pass-cli/releases/download/${pkgver}"

source_aarch64=("pass-cli-aarch64-${pkgver}::${_downloadUrl}/pass-cli-linux-aarch64")
source_x86_64=("pass-cli-x86_64-${pkgver}::${_downloadUrl}/pass-cli-linux-x86_64")

sha256sums_aarch64=('eee38fc4549a5dfcbb794aafcb6d517c9e0cd0dc3c53bbb2997fd8142ed681c7')
sha256sums_x86_64=('4089bdf5981140ac5bee65d2d79bf98767537f54d33197b79e5f86c630714842')

package() {
	install -Dm755 "pass-cli-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/pass-cli"
}
