# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=pnpm-bin
_pkgname=pnpm
pkgver=10.23.0
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
sha256sums_x86_64=('6e5f25fad67ba1b4fe1050c8992ced33ce8689245a834ddec149940a20c2be5c')
sha256sums_aarch64=('b9de8dcc72dc6f23d69b64ee63dd1c4c75f35f5eaaa8e9cbeaec5849d66b70b0')