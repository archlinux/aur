# Maintainer: Shayne Hartford<shayneehartford@gmail.com>
pkgname=nvflash
pkgver=5.692.0
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
  --body-data 'id=1813&server_id=3' \
  --output-document=${pkgname}-${pkgver}.zip \
  - https://www.techpowerup.com/download/nvidia-nvflash/ || true

	unzip ${pkgname}-${pkgver}.zip
}

package() {
	install -Dm755 x64/${pkgname} "${pkgdir}"/usr/bin/nvflash
}
