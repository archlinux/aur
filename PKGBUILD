# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=proton-pass-cli-bin
pkgver=2.5.1 # datasource=github-releases depName=protonpass/pass-cli
pkgrel=2
pkgdesc='A command-line interface for managing your Proton Pass vaults, items, and secrets.'
provides=('proton-pass-cli')
conflicts=('proton-pass-cli')
arch=('aarch64' 'x86_64')
url='https://protonpass.github.io/pass-cli/'
depends=('glibc' 'libgcc')
license=('GPL-3.0-or-later')

_downloadUrl="https://github.com/protonpass/pass-cli/releases/download/${pkgver}"

source_aarch64=("pass-cli-aarch64-${pkgver}::${_downloadUrl}/pass-cli-linux-aarch64")
source_x86_64=("pass-cli-x86_64-${pkgver}::${_downloadUrl}/pass-cli-linux-x86_64")

sha256sums_aarch64=('03042c8ad70b21fa1da834f2e4e74484710ab3f05754af10c5035acdf68f3c87')
sha256sums_x86_64=('40e27645e0485f5f0db928b81469d1c5a7c8968a162956e940069476244c02b1')

package() {
	install -Dm755 "pass-cli-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/pass-cli"
}
