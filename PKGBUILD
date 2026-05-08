# Maintainer: waschtl <tyrolyean@tyrolyean.net>

_pkgname=flood
pkgname=${_pkgname}-bin
provides=("nodejs-${_pkgname}")
conflicts=("nodejs-${_pkgname}")
pkgver=4.14.0
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
	'8b166a0f42a617b83106b3b19a2ef8a30ba6bf2562a2a33cab9b3ea06b0ecf18e496ed5776134e413aef0aadc1ceaa3f9f76fac08d96f80e41d7ec390e43fa9d'
	'e875c515a6197064bcfc26d07bfab26adcd577c6cded879be2902a699840eb563f2376f373ba3c1fdf7af2eb32b4676b569429d1f0f53aba24617a5ae7045f0d'
)

b2sums_aarch64=(
	'3bd577de13e4b94a05f742f68a53fd295ac2dfa1303b358489032765280791581c442220a5cf33569fc5db2544b89227b3d51041f57b0b3bb93c457eae583ce2'
	'85af87544c5744661a99a44b0ef9f17e50face24a9fd74d1a81b6b93aaf9b995fbaeb74a4a7aa4ae831fae5ecabb1539143e53bd97e279e56f73b5c8b4d823a2'
)

source_x86_64=(
	"flood-linux::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64"
	"https://raw.githubusercontent.com/jesec/${_pkgname}/refs/tags/v${pkgver}/distribution/shared/${_pkgname}%40.service"
)

sha512sums_x86_64=(
	'dac2314e3aed3c4c6f1234673e296e874959ebebfa4536c7ebc8acc70248d1144694735654a245e95b80be299597d3baef8c01985e534bb512751d7269198ef8'
	'e875c515a6197064bcfc26d07bfab26adcd577c6cded879be2902a699840eb563f2376f373ba3c1fdf7af2eb32b4676b569429d1f0f53aba24617a5ae7045f0d'
)

b2sums_x86_64=(
	'4aa1bfebe989e15c579c8631a6e78e6e418841c6b6e4b835c9319b2899d46ffc54eb46bd43c1bcea28e03ffb65982efa51812683b081fe2be51c164d870e0a8e'
	'85af87544c5744661a99a44b0ef9f17e50face24a9fd74d1a81b6b93aaf9b995fbaeb74a4a7aa4ae831fae5ecabb1539143e53bd97e279e56f73b5c8b4d823a2'
)

package() {
  install -Dm555 "${srcdir}/flood-linux" "${pkgdir}/usr/bin/flood"
  install -Dm644 "${srcdir}/flood%40.service" "${pkgdir}/usr/lib/systemd/system/flood@.service"
}
