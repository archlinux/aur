# Maintainer: Shayne Hartford<shayneehartford@gmail.com>
pkgname=nvflash
pkgver=5.728
pkgrel=1
pkgdesc="A tool to update the the firmware of Nvidia display adapters."
url="https://www.techpowerup.com/download/nvidia-nvflash/"
arch=('x86_64' 'i686')
license=('unknown')
makedepends=('wget' 'unzip')

build() {
	wget \
    --method POST \
    --header 'content-type: application/x-www-form-urlencoded' \
    --body-data 'id=2075&server_id=3' \
    --output-document="${pkgname}-${pkgver}.zip" \
    - "${url}" || true

	unzip "${pkgname}-${pkgver}.zip"
}

package() {
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
