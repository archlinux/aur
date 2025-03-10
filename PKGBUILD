# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=pnpm-bin
_pkgname=pnpm
pkgver=10.6.2
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
sha256sums_x86_64=('43dd6fc5a2f1c3acbdf148a3c69cbcc8a73df76c3ccf4a2b85b6d2ce2ddc53ba')
sha256sums_aarch64=('f961596dd44abd00226b024b89914c4fd312176eb0ff1eb911ff77e1d83d6f21')