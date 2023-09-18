# Maintainer: weebney <weebney at gmail dot com>
pkgname=cove
pkgver=0.0.11
pkgrel=2
pkgdesc="A combined BitTorrent frontend and DHT indexer for personal use"
arch=("x86_64")
url="https://github.com/anacrolix/cove"
license=("custom")
optdepends=("ffmpeg: video transcoding and metadata extraction")
source=("${url}/releases/download/v${pkgver}/cove-v${pkgver}-linux-amd64.zip" "launcher.sh")
md5sums=('da9cb2cbac2919d6692c942747871265'
         SKIP)

package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm775 "./launcher.sh" "${pkgdir}/usr/bin/cove"

	install -d "${pkgdir}/opt/cove"
	cd "${srcdir}"
	install -Dm775 * "${pkgdir}/opt/cove/"
}

