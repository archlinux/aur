# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=proton-pass-cli-bin
pkgver=2.3.2 # datasource=github-releases depName=protonpass/pass-cli
pkgrel=1
pkgdesc='A command-line interface for managing your Proton Pass vaults, items, and secrets.'
arch=('aarch64' 'x86_64')
url='https://protonpass.github.io/pass-cli/'
depends=('glibc' 'libgcc')
license=('GPL-3.0-or-later')

_downloadUrl="https://github.com/protonpass/pass-cli/releases/download/${pkgver}"

source_aarch64=("pass-cli-aarch64-${pkgver}::${_downloadUrl}/pass-cli-linux-aarch64")
source_x86_64=("pass-cli-x86_64-${pkgver}::${_downloadUrl}/pass-cli-linux-x86_64")

sha256sums_aarch64=('b601334cc78f4ddb125708c6d64b8b509e5a82a337bb8bead0bc2f86dd9cabff')
sha256sums_x86_64=('f95c6b39b45d96b670f249ccbb56b06b3a17d4579357d2d04c4ac64e4ffbeff7')

package() {
	install -Dm755 "pass-cli-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/pass-cli"
}
