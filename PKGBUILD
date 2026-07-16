# Maintainer: waschtl <tyrolyean@tyrolyean.net>

_pkgname=flood
pkgname=${_pkgname}-bin
provides=("nodejs-${_pkgname}")
conflicts=("nodejs-${_pkgname}")
pkgver=4.15.0
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
	'd3a6abd2e4980ddb6f9392768bbf6ddba6e8ca90a6b5a7e553dea6fbca666ccabcdb0d2b9b7ea426c8d8e0e92c52207d5fb34ee19fd0977994f573bc8b8f2f0e'
	'e875c515a6197064bcfc26d07bfab26adcd577c6cded879be2902a699840eb563f2376f373ba3c1fdf7af2eb32b4676b569429d1f0f53aba24617a5ae7045f0d'
)

b2sums_aarch64=(
	'25433e8408d4f28c2fae00fa381b587ba007ac960cc4d16ea07e71813827a99db821e471adceb28beebbd119b0495b7ee9a129514816bc4769472db5d5db34e8'
	'85af87544c5744661a99a44b0ef9f17e50face24a9fd74d1a81b6b93aaf9b995fbaeb74a4a7aa4ae831fae5ecabb1539143e53bd97e279e56f73b5c8b4d823a2'
)

source_x86_64=(
	"flood-linux::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64"
	"https://raw.githubusercontent.com/jesec/${_pkgname}/refs/tags/v${pkgver}/distribution/shared/${_pkgname}%40.service"
)

sha512sums_x86_64=(
	'da86cf92930912739c9448787872774f4880964962ddb21fcee2a85982b6af5e7066ec1dd90bb98aa9b553f130cde69524286b3d3217560d9813abad9314a5b6'
	'e875c515a6197064bcfc26d07bfab26adcd577c6cded879be2902a699840eb563f2376f373ba3c1fdf7af2eb32b4676b569429d1f0f53aba24617a5ae7045f0d'
)

b2sums_x86_64=(
	'd9783f5725f80c3d32efe0cf5bfe51d830620a2a41170b66b2ede2a8385f79373c4bbaec64bf8fd611c84f355c6588f9320ea3c92a1ca54ed2220c88c65fb597'
	'85af87544c5744661a99a44b0ef9f17e50face24a9fd74d1a81b6b93aaf9b995fbaeb74a4a7aa4ae831fae5ecabb1539143e53bd97e279e56f73b5c8b4d823a2'
)

package() {
  install -Dm555 "${srcdir}/flood-linux" "${pkgdir}/usr/bin/flood"
  install -Dm644 "${srcdir}/flood%40.service" "${pkgdir}/usr/lib/systemd/system/flood@.service"
}
