# Maintainer: waschtl <tyrolyean@tyrolyean.net>

_pkgname=flood
pkgname=${_pkgname}-bin
provides=("nodejs-${_pkgname}")
conflicts=("nodejs-${_pkgname}")
pkgver=4.9.3
pkgrel=2
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
	'0d6b209fb1cd72916ddea8626f0cc08743c6ec9a01e32702bb5c92e283cd47f1'
	)
sha512sums=(
	'5f13dfc412425bb474f2d7229f77bdf34c55e46a3e3d3621d1ea4f917650f4d6616cefd4e187a357f3054825792ddb96d806b51ca63d22aeddbaee350f4a3bd7'
	'ffc9d6a86c8c5dcca5f66791be4ac70d75b068162f442fccbe8876b3a940fe3858522ad56dca9c191b06afe87c501b17898e9f150d0eff842f7d51f9f972a6f0'
	)

package() {
  install -Dm555 "${srcdir}/flood-linux-x64" "${pkgdir}/usr/bin/flood-linux-x64"
  install -Dm644 "${srcdir}/flood%40.service" "${pkgdir}/usr/lib/systemd/system/flood@.service"
}
