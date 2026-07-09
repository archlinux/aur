# Maintainer: mapleafgo <mapleafgo at 163 dot com>
# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=pnpm-bin
_pkgname=pnpm
pkgver=11.10.0
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

sha256sums_x86_64=('cf22c9f1ba90f67c9a5cfb1cbe9c2087cf4c3a5c409dad738c1f8a38b8137666')
sha256sums_aarch64=('7da014033800db506095d8d5eb15c4b1df7aa9cc6a4992634e4d59c3985e720b')

package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/pnpm"
	cp -r "${srcdir}/dist" "${pkgdir}/usr/bin/"
}