# Maintainer: mapleafgo <mapleafgo at 163 dot com>
# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=pnpm-bin
_pkgname=pnpm
pkgver=12.0.0
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

sha256sums_x86_64=('d93497ba07d5dfc7d527b30905fdd24f55c87618ea23ea3af287cdff061510e0')
sha256sums_aarch64=('04ae74abf0f620189f1dd6cbb2586f8f6267e42268f7992e2f9dfaa67e9b323c')

package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/pnpm"
	cp -r "${srcdir}/dist" "${pkgdir}/usr/bin/"
}