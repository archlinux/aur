# Maintainer: waschtl <tyrolyean@tyrolyean.net>

_pkgname=flood
pkgname=${_pkgname}-bin
provides=("nodejs-${_pkgname}")
conflicts=("nodejs-${_pkgname}")
pkgver=4.10.0
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
	'74584d63d04919c04487be2962ba06e67967dcb6b7df7e0ae73993291f9bb691'
	'893a6b83de3b9dec9f0f131d16ba5b50806d57e435350d65d93fb4d39c13622a'
)
sha512sums=(
	'5532cadbca3db37b31a74b38d52b4060770257f2632ff369025e13d7ccaf1b7fe669ec85f70b53cadf96ee1933af9fdf6b75edb5a1fe25401ae577e5bea5875a'
	'e875c515a6197064bcfc26d07bfab26adcd577c6cded879be2902a699840eb563f2376f373ba3c1fdf7af2eb32b4676b569429d1f0f53aba24617a5ae7045f0d'
)

package() {
  install -Dm555 "${srcdir}/flood-linux-x64" "${pkgdir}/usr/bin/flood"
  install -Dm644 "${srcdir}/flood%40.service" "${pkgdir}/usr/lib/systemd/system/flood@.service"
}
