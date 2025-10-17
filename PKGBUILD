# Maintainer: waschtl <tyrolyean@tyrolyean.net>

_pkgname=flood
pkgname=${_pkgname}-bin
provides=("nodejs-${_pkgname}")
conflicts=("nodejs-${_pkgname}")
pkgver=4.11.0
pkgrel=1
pkgdesc="A modern web UI for various torrent clients with a Node.js backend and React frontend"
arch=('x86_64')
url="https://github.com/jesec/${_pkgname}"
license=('GPL-3.0')
makedepends=()
optdepends=()
source=(
	"${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64"
	"https://raw.githubusercontent.com/jesec/${_pkgname}/refs/tags/v${pkgver}/distribution/shared/${_pkgname}%40.service"
)
sha256sums=(
	'ba36cd2d0f2638063e8daf252aafa29df7826390465c11c3ae9a83354e833e65'
	'893a6b83de3b9dec9f0f131d16ba5b50806d57e435350d65d93fb4d39c13622a'
)
sha512sums=(
	'1d46e2b6de5968b472e5d750df0f18795e29ad44ad71ccb955afc33662fa54edf5016c1e59af1389c3ae14322b21f8165f9817a39a7522886a670a777ef5f8d3'
	'e875c515a6197064bcfc26d07bfab26adcd577c6cded879be2902a699840eb563f2376f373ba3c1fdf7af2eb32b4676b569429d1f0f53aba24617a5ae7045f0d'
)

package() {
  install -Dm555 "${srcdir}/flood-linux-x64" "${pkgdir}/usr/bin/flood"
  install -Dm644 "${srcdir}/flood%40.service" "${pkgdir}/usr/lib/systemd/system/flood@.service"
}
