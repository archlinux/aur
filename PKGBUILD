# Maintainer: waschtl <tyrolyean@tyrolyean.net>

_pkgname=flood
pkgname=${_pkgname}-bin
provides=("nodejs-${_pkgname}")
conflicts=("nodejs-${_pkgname}")
pkgver=4.8.5
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
	'7ec4d720e29a6c7105e9860447cb9b72186fb1958d49596280e00ba27c6fe33a'
	'893a6b83de3b9dec9f0f131d16ba5b50806d57e435350d65d93fb4d39c13622a'
	)
sha512sums=(
	'c8035666abd4af33d9c218b4ee1c86db3540ba0d30899561c7b100278bea52b5ed49b95a5375c8fe99ab6eb78ca8ef3694da69bdf2fcc413a5ba31ed87e06741'
	'e875c515a6197064bcfc26d07bfab26adcd577c6cded879be2902a699840eb563f2376f373ba3c1fdf7af2eb32b4676b569429d1f0f53aba24617a5ae7045f0d'
	)

package() {
  install -Dm555 "${srcdir}/flood-linux-x64" "${pkgdir}/usr/bin/flood-linux-x64"
  install -Dm644 "${srcdir}/flood%40.service" "${pkgdir}/usr/lib/systemd/system/flood@.service"
}
