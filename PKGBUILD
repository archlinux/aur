# Maintainer: Shayne Hartford<shayneehartford@gmail.com>
pkgname=nvflash
pkgver=5.414.0
pkgrel=4
pkgdesc="A tool to update the the firmware of Nvidia display adapters."
url="https://www.techpowerup.com/download/nvidia-nvflash/"
arch=('x86_64' 'i686')
license=('unknown')
makedepends=('wget' 'unzip')

build() {
	wget \
  --method POST \
  --header 'content-type: application/x-www-form-urlencoded' \
  --body-data 'id=808&server_id=12' \
  --output-document=${pkgname}-${pkgver}.zip \
  - https://www.techpowerup.com/download/nvidia-nvflash/ || true

	unzip ${pkgname}-${pkgver}.zip
}

package() {
	install -Dm755 ${pkgname}_linux "${pkgdir}"/usr/bin/nvflash
}
