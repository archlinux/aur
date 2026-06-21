# Maintainer: waschtl <tyrolyean@tyrolyean.net>

_pkgname=flood
pkgname=${_pkgname}-bin
provides=("nodejs-${_pkgname}")
conflicts=("nodejs-${_pkgname}")
pkgver=4.14.3
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
	'4e5d111d5ed341df4daf47bdb59382301fd4d28a28b41684696d3d7f5896baa6027a3483d8407b53c2db993e4375d8442f81c4d468d456a81cff63bc4d7f32de'
	'e875c515a6197064bcfc26d07bfab26adcd577c6cded879be2902a699840eb563f2376f373ba3c1fdf7af2eb32b4676b569429d1f0f53aba24617a5ae7045f0d'
)

b2sums_aarch64=(
	'12bad149b03cd3392e492fb255b2a2e4198b04cc380b14a84bbec0b9fd3add62c32faa43e6874bfbe7f4bf8126487a1cbc0641131065fd4ed5d5efb3e2743acc'
	'85af87544c5744661a99a44b0ef9f17e50face24a9fd74d1a81b6b93aaf9b995fbaeb74a4a7aa4ae831fae5ecabb1539143e53bd97e279e56f73b5c8b4d823a2'
)

source_x86_64=(
	"flood-linux::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64"
	"https://raw.githubusercontent.com/jesec/${_pkgname}/refs/tags/v${pkgver}/distribution/shared/${_pkgname}%40.service"
)

sha512sums_x86_64=(
	'b401a2edf973956b8ef9e973b9cb824188923759d5870ce6056c2530ea752d6a6299dd8d6487147797333c3e417ae855adfd7f73bb16b6dc6e3d26dfcd4676cc'
	'e875c515a6197064bcfc26d07bfab26adcd577c6cded879be2902a699840eb563f2376f373ba3c1fdf7af2eb32b4676b569429d1f0f53aba24617a5ae7045f0d'
)

b2sums_x86_64=(
	'05e1be7e0957d4156060d23e030aa6794adb4eb7eaa0e8e130aff82be3c86ab1ad3f585be7f242a4f40633ca7bfc9222e17f2f1c76cc24feccb17d715a63f1f7'
	'85af87544c5744661a99a44b0ef9f17e50face24a9fd74d1a81b6b93aaf9b995fbaeb74a4a7aa4ae831fae5ecabb1539143e53bd97e279e56f73b5c8b4d823a2'
)

package() {
  install -Dm555 "${srcdir}/flood-linux" "${pkgdir}/usr/bin/flood"
  install -Dm644 "${srcdir}/flood%40.service" "${pkgdir}/usr/lib/systemd/system/flood@.service"
}
