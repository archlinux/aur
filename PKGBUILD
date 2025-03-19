# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=pnpm-bin
_pkgname=pnpm
pkgver=10.6.5
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
sha256sums_x86_64=('75a7f1c70d3ce7ff7f6f0a0815010246ff14142418f66126a2c2be83a65f284d')
sha256sums_aarch64=('9b9d1d3f026f969b33596dbf6c46f31a8078f0fce412231b2093d7e6a36aaa5c')