# Maintainer: waschtl <tyrolyean@tyrolyean.net>

_pkgname=flood
pkgname=${_pkgname}-bin
provides=("nodejs-${_pkgname}")
conflicts=("nodejs-${_pkgname}")
pkgver=4.12.6
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
	'e488df15958278b814059f4180d10ca0e4db7bbcb9773d439b768d76acc4daf4'
	'893a6b83de3b9dec9f0f131d16ba5b50806d57e435350d65d93fb4d39c13622a'
)
sha512sums=(
	'b07243484980408cbb97b5f715281bbac1a35b56387d5924a5b379ccf12d9a88a415752325dc0e3f07bb81d0064ecc27f0036889e1e050e811161825dbcad71a'
	'e875c515a6197064bcfc26d07bfab26adcd577c6cded879be2902a699840eb563f2376f373ba3c1fdf7af2eb32b4676b569429d1f0f53aba24617a5ae7045f0d'
)

package() {
  install -Dm555 "${srcdir}/flood-linux-x64" "${pkgdir}/usr/bin/flood"
  install -Dm644 "${srcdir}/flood%40.service" "${pkgdir}/usr/lib/systemd/system/flood@.service"
}
