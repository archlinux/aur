# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=pnpm-cli
_pkgname=pnpm
pkgver=9.15.1
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
sha256sums_x86_64=('b46a2309e590aad65c02504faca24e500c457b4ba2861274ebd7a7ecabca762d')
sha256sums_aarch64=('7796ba909840e9ebad686cac8e2864819ac367b7f7f2a89fff788d84c4cb32b5')