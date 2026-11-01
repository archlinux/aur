# Maintainer: waschtl <tyrolyean@tyrolyean.net>

_pkgname=flood
pkgname=${_pkgname}-bin
provides=("nodejs-${_pkgname}")
conflicts=("nodejs-${_pkgname}")
pkgver=4.16.4
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
	'c2ceabd06c5abde7803b0a94b1705bdc024a47ae8f530f4ea3ab1632f51438554921ff0d3c393686ce38ddf2cd885501a2ebe4298e1fa28705617a1429663ab3'
	'e875c515a6197064bcfc26d07bfab26adcd577c6cded879be2902a699840eb563f2376f373ba3c1fdf7af2eb32b4676b569429d1f0f53aba24617a5ae7045f0d'
)

b2sums_aarch64=(
	'556b2c9f701c2be3babb467d43be4b58ced5739fb02a3ea1577e91c5f576cc8ba635806a4c21ee00d52dc422869426cfe0905340eb9e21b5321029c4f40326be'
	'85af87544c5744661a99a44b0ef9f17e50face24a9fd74d1a81b6b93aaf9b995fbaeb74a4a7aa4ae831fae5ecabb1539143e53bd97e279e56f73b5c8b4d823a2'
)

source_x86_64=(
	"flood-linux::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64"
	"https://raw.githubusercontent.com/jesec/${_pkgname}/refs/tags/v${pkgver}/distribution/shared/${_pkgname}%40.service"
)

sha512sums_x86_64=(
	'40e91d7472316dfa9187fc7df85ff696fc22d78c6b6201321142b69af9372304f2a4985949c51ae5eb3756b93f5538e49cebdf7a7fe44e326ddfb564d7de7e94'
	'e875c515a6197064bcfc26d07bfab26adcd577c6cded879be2902a699840eb563f2376f373ba3c1fdf7af2eb32b4676b569429d1f0f53aba24617a5ae7045f0d'
)

b2sums_x86_64=(
	'bf44ddc2c6589299ebfea15d8207d6233811e79ef017f9c4e933b69355fd9e402575b40fb75666aede3661aedba4a9cfa454150b4ab30bccf5f763e899a95309'
	'85af87544c5744661a99a44b0ef9f17e50face24a9fd74d1a81b6b93aaf9b995fbaeb74a4a7aa4ae831fae5ecabb1539143e53bd97e279e56f73b5c8b4d823a2'
)

package() {
  install -Dm555 "${srcdir}/flood-linux" "${pkgdir}/usr/bin/flood"
  install -Dm644 "${srcdir}/flood%40.service" "${pkgdir}/usr/lib/systemd/system/flood@.service"
}
