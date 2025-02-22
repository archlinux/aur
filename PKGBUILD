# Maintainer: longyinstudio<1606776851@qq.com>
# Contributor: longyinstudio<1606776851@qq.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kevin Majewski < kevin.majewski02 AT gmail.com >
pkgname=video-downloader-longyinstudio
pkgver=0.2.0
pkgrel=1
pkgdesc="Download videos from websites like YouTube and many others (based on yt-dlp)"
arch=('x86_64')
url="https://github.com/LongYinStudio/video-downloader"
license=('mit')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
# source_x86_64=("https://github.com/LongYinStudio/video-downloader/releases/download/v$pkgver/video-downloader_"$pkgver"_amd64.deb")
source=("https://github.com/LongYinStudio/video-downloader/releases/download/v$pkgver/video-downloader_"$pkgver"_amd64.deb")
# sha256sums=('79d276d5cdf93e2c39ff842821bbde50fae68cf47249844ef28425e0e6a9b6e0')
sha256sums=('SKIP')
install=video-downloader-longyinstudio.install
# makedepends=('')

package() {
	# 解压 .deb 文件
	cd "$srcdir" || exit
	ar x "video-downloader_$pkgver"_amd64.deb

	# 提取 data.tar.gz
	tar -xpf data.tar.gz -C "$pkgdir"

	# 清理临时文件
	rm -f control.tar.gz data.tar.gz debian-binary
}
