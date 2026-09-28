# Maintainer: mapleafgo <mapleafgo at 163 dot com>
# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=pnpm-bin
_pkgname=pnpm
pkgver=12.8.0
pkgrel=1
pkgdesc="Fast, disk space efficient package manager (No dependency on nodejs)"
arch=('x86_64' 'aarch64')
url="https://github.com/pnpm/pnpm"
license=('MIT')
conflicts=(${_pkgname})
provides=(${_pkgname})
depends=('git')
options=('!strip')
_app=${_pkgname}-${pkgver}-${CARCH}

source_x86_64=(${_pkgname}-${pkgver}-x86_64::https://github.com/pnpm/pnpm/releases/download/v${pkgver}/pnpm-linux-x64.tar.gz)
source_aarch64=(${_pkgname}-${pkgver}-aarch64::https://github.com/pnpm/pnpm/releases/download/v${pkgver}/pnpm-linux-arm64.tar.gz)

sha256sums_x86_64=('412de0471da505fbc45415c44ae6b206454e1ab567ce7883b4a5f8dbea68b05e')
sha256sums_aarch64=('14e7f2904c07008d14bc91aff83a7221c4ec72aff5309465f59dbc9aaa112e57')

package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/pnpm"
	cp -r "${srcdir}/dist" "${pkgdir}/usr/bin/"
}