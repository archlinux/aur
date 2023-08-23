# Maintainer: weebney <weebney at gmail dot com>
pkgname=cove
pkgver=0.0.8
pkgrel=1
pkgdesc="A combined BitTorrent frontend and DHT indexer for personal use"
arch=("x86_64")
url="https://github.com/anacrolix/cove"
license=("custom")
makedepends=("unzip")
optdepends=("ffmpeg: video transcoding and metadata extraction")
source=("${url}/releases/download/v${pkgver}/cove-linux-amd64.zip" "launcher.sh")
md5sums=('5c93435590cc8acc227f1b4e0f7b96bd' 'SKIP')
                  
package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm775 "./launcher.sh" "${pkgdir}/usr/bin/cove"

	install -d "${pkgdir}/opt/cove"
	cd "${srcdir}"
	install -Dm775 * "${pkgdir}/opt/cove/"
}

