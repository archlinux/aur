# Maintainer: waschtl <tyrolyean@tyrolyean.net>

_pkgname=flood
pkgname=${_pkgname}-bin
provides=("nodejs-${_pkgname}")
conflicts=("nodejs-${_pkgname}")
pkgver=4.9.3
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
	'6fbc250bcff9c55aa4a32dc0a28ce5fc7e7e131696042760c2d81ddd12747859'
	'893a6b83de3b9dec9f0f131d16ba5b50806d57e435350d65d93fb4d39c13622a'
	)
sha512sums=(
	'5f13dfc412425bb474f2d7229f77bdf34c55e46a3e3d3621d1ea4f917650f4d6616cefd4e187a357f3054825792ddb96d806b51ca63d22aeddbaee350f4a3bd7'
	'e875c515a6197064bcfc26d07bfab26adcd577c6cded879be2902a699840eb563f2376f373ba3c1fdf7af2eb32b4676b569429d1f0f53aba24617a5ae7045f0d'
	)

package() {
  install -Dm555 "${srcdir}/flood-linux-x64" "${pkgdir}/usr/bin/flood-linux-x64"
  install -Dm644 "${srcdir}/flood%40.service" "${pkgdir}/usr/lib/systemd/system/flood@.service"
}
