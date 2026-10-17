# Maintainer: waschtl <tyrolyean@tyrolyean.net>

_pkgname=flood
pkgname=${_pkgname}-bin
provides=("nodejs-${_pkgname}")
conflicts=("nodejs-${_pkgname}")
pkgver=4.16.3
pkgrel=1
pkgdesc="A modern web UI for various torrent clients with a Node.js backend and React frontend"
arch=('x86_64' 'aarch64')
url="https://github.com/jesec/${_pkgname}"
license=('GPL-3.0')
makedepends=()
optdepends=()

source_aarch64=(
	"/flood-linux::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64"
	"https://raw.githubusercontent.com/jesec/${_pkgname}/refs/tags/v${pkgver}/distribution/shared/${_pkgname}%40.service"
)

sha512sums_aarch64=(
	'f12ca2faddfb1d0b67501816fe227ce2e75980e3efac064b0b8f9ebc5565dd8ece10f91e9198f5b5db9fccd37e73ba520dbb8333c976148587bf7c7d08936ce9'
	'e875c515a6197064bcfc26d07bfab26adcd577c6cded879be2902a699840eb563f2376f373ba3c1fdf7af2eb32b4676b569429d1f0f53aba24617a5ae7045f0d'
)

b2sums_aarch64=(
	'd96558524bbdce19a0f13d8686d78082f55d0185721c1e79c2e441c7e6979bea9d130a0dda5325c08d72b228058e2faf03b0724bcdb4f24f37e9fcdcce64a72a'
	'85af87544c5744661a99a44b0ef9f17e50face24a9fd74d1a81b6b93aaf9b995fbaeb74a4a7aa4ae831fae5ecabb1539143e53bd97e279e56f73b5c8b4d823a2'
)

source_x86_64=(
	"flood-linux::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64"
	"https://raw.githubusercontent.com/jesec/${_pkgname}/refs/tags/v${pkgver}/distribution/shared/${_pkgname}%40.service"
)

sha512sums_x86_64=(
	'1e8ec783489e2f1e95071d9f3b43d781b242474ea5c57f19689d1d91eabad86706eb3829bba08a39141ef16d93ab323f2d2c1df9dccba36157e6658914c3fef8'
	'e875c515a6197064bcfc26d07bfab26adcd577c6cded879be2902a699840eb563f2376f373ba3c1fdf7af2eb32b4676b569429d1f0f53aba24617a5ae7045f0d'
)

b2sums_x86_64=(
	'628f40711f953c6db6497b38bce001330fce16c9338846b306fd178b2651bc32bc56998891163642745178ce54da1aebbcfe94ab9452b5c3825d5d00710a5190'
	'85af87544c5744661a99a44b0ef9f17e50face24a9fd74d1a81b6b93aaf9b995fbaeb74a4a7aa4ae831fae5ecabb1539143e53bd97e279e56f73b5c8b4d823a2'
)

package() {
  install -Dm555 "${srcdir}/flood-linux" "${pkgdir}/usr/bin/flood"
  install -Dm644 "${srcdir}/flood%40.service" "${pkgdir}/usr/lib/systemd/system/flood@.service"
}
