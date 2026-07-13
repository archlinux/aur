# Maintainer: mapleafgo <mapleafgo at 163 dot com>
# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=pnpm-bin
_pkgname=pnpm
pkgver=11.12.0
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

sha256sums_x86_64=('dd19bfd8bcd33a3b38dcce335e8d233194c0a61ffe1f5bcf5047f60f6d4978b8')
sha256sums_aarch64=('d9f643aaba20a77ac101bcfff77711e7bc01ee4006cc30a26bef71e7570f20fb')

package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/pnpm"
	cp -r "${srcdir}/dist" "${pkgdir}/usr/bin/"
}