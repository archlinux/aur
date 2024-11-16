# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=pnpm-cli
pkgver=9.13.2
pkgrel=2
pkgdesc="Fast, disk space efficient package manager (Pure Packaging, no dependencies)"
arch=('x86_64' 'aarch64')
url="https://github.com/pnpm/pnpm"
license=('MIT')
conflicts=('pnpm')
options=('!strip')
source_x86_64=(${pkgname}-${pkgver}-x86_64::https://github.com/pnpm/pnpm/releases/download/v${pkgver}/pnpm-linux-x64)
source_aarch64=(${pkgname}-${pkgver}-aarch64::https://github.com/pnpm/pnpm/releases/download/v${pkgver}/pnpm-linux-arm64)
sha256sums_x86_64=("SKIP")
sha256sums_aarch64=("SKIP")
_app=${pkgname}-${pkgver}-${CARCH}

# pkgver() {
# 	curl https://api.github.com/repos/pnpm/pnpm/releases/latest | grep tag_name | awk -F '\"' '{print $4}' | awk -F 'v' '{print $2}'
# }

package() {
	install -Dm755 "${srcdir}/${_app}" "${pkgdir}/usr/bin/pnpm"
}
