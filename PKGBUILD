# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=proton-pass-cli-bin
pkgver=2.2.0 # datasource=github-releases depName=protonpass/pass-cli
pkgrel=1
pkgdesc='A command-line interface for managing your Proton Pass vaults, items, and secrets.'
arch=('aarch64' 'x86_64')
url='https://protonpass.github.io/pass-cli/'
depends=('glibc' 'libgcc')
license=('GPL-3.0-or-later')

_downloadUrl="https://github.com/protonpass/pass-cli/releases/download/${pkgver}"

source_aarch64=("pass-cli-aarch64-${pkgver}::${_downloadUrl}/pass-cli-linux-aarch64")
source_x86_64=("pass-cli-x86_64-${pkgver}::${_downloadUrl}/pass-cli-linux-x86_64")

sha256sums_aarch64=('ec4082d8df4c9e2455c1faf8018fba7fc90d8572217377851d9596e1918f634b')
sha256sums_x86_64=('b880b43bb618c6e3711a41f0652078ab6030205452b988d8f075b71d49445735')

package() {
	install -Dm755 "pass-cli-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/pass-cli"
}
