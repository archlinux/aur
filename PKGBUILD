# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=pnpm-bin
_pkgname=pnpm
pkgver=10.5.0
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
sha256sums_x86_64=('f5e864f448e89326dbb2daf02af52bb23dd58a3308d4f843325cb6d28c622c1c')
sha256sums_aarch64=('33ac75083a4690cee73c96b16cea6dbf6b8b2ed8da19207051dfeaff1297d790')