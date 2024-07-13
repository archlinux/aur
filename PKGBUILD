# Maintainer: weebney <weebney at gmail dot com>
# Maintainer: anacrolix <anacrolix@gmail.com>
pkgname=cove
pkgver=0.4.9
pkgrel=1
pkgdesc="A combined BitTorrent frontend and DHT indexer for personal use"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/anacrolix/cove"
license=("custom")
optdepends=("ffmpeg: video transcoding and metadata extraction")
source_x86_64=( "${url}/releases/download/v${pkgver}/cove-v${pkgver}-linux-amd64.zip" "launcher.sh")
source_aarch64=("${url}/releases/download/v${pkgver}/cove-v${pkgver}-linux-arm64.zip" "launcher.sh")
source_armv7h=( "${url}/releases/download/v${pkgver}/cove-v${pkgver}-linux-arm.zip"   "launcher.sh")
md5sums_x86_64=('33d3356676b1d440cd7e924efe185b16'
                'a3f4019da293bc90e751f787eb79cb22')
md5sums_armv7h=('f7c3a73aaf6dccac151fc95d092bcfc8'
                'a3f4019da293bc90e751f787eb79cb22')
md5sums_aarch64=('6bd13fc79ed33e9aa0feabcc9b655503'
                 'a3f4019da293bc90e751f787eb79cb22')

package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm775 "./launcher.sh" "${pkgdir}/usr/bin/cove"

	install -d "${pkgdir}/opt/cove"
	cd "${srcdir}"
	install -Dm775 * "${pkgdir}/opt/cove/"
}

