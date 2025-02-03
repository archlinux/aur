# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=pnpm-bin
_pkgname=pnpm
pkgver=10.2.0
pkgrel=1
pkgdesc="Fast, disk space efficient package manager (No dependency on nodejs)"
arch=('x86_64' 'aarch64')
url="https://github.com/pnpm/pnpm"
license=('MIT')
conflicts=(${_pkgname})
provides=(${_pkgname})
depends=('git')
options=('!strip')
source_x86_64=(${_pkgname}-${pkgver}-x86_64::https://github.com/pnpm/pnpm/releases/download/v${pkgver}/pnpm-linux-x64)
source_aarch64=(${_pkgname}-${pkgver}-aarch64::https://github.com/pnpm/pnpm/releases/download/v${pkgver}/pnpm-linux-arm64)
_app=${_pkgname}-${pkgver}-${CARCH}

package() {
	install -Dm755 "${srcdir}/${_app}" "${pkgdir}/usr/bin/pnpm"
}
sha256sums_x86_64=('38ab95d36b8ae79609e2b899ddf9e792cd00b6ca13a62789608aa45b4bf4a9d1')
sha256sums_aarch64=('8d78d2e46ad7a592286ab187a6092033e053b88fda61db263f908a23f4449bf0')