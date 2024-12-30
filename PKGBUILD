# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=pnpm-cli
_pkgname=pnpm
pkgver=9.15.2
pkgrel=1
pkgdesc="Fast, disk space efficient package manager (No dependency on nodejs)"
arch=('x86_64' 'aarch64')
url="https://github.com/pnpm/pnpm"
license=('MIT')
conflicts=(${_pkgname})
provides=(${_pkgname})
depends=('git')
options=('!strip')
source_x86_64=(${pkgname}-${pkgver}-x86_64::https://github.com/pnpm/pnpm/releases/download/v${pkgver}/pnpm-linux-x64)
source_aarch64=(${pkgname}-${pkgver}-aarch64::https://github.com/pnpm/pnpm/releases/download/v${pkgver}/pnpm-linux-arm64)
_app=${pkgname}-${pkgver}-${CARCH}

package() {
	install -Dm755 "${srcdir}/${_app}" "${pkgdir}/usr/bin/pnpm"
}
sha256sums_x86_64=('3cea7ada6e703acba25179d80a660a1f18b397a55fb4d721a2a4d04406abe27a')
sha256sums_aarch64=('e50ec75726fa008691ac138f19ef934ece70b6cf7d8991b8bfcb06c621cc587f')