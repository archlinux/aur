# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='A command line utility to merge, split and chapterize audiobook files such as mp3, ogg, flac, m4a or m4b'
pkgname=('m4b-tool-bin')
pkgver=0.4.2~20210604
pkgrel=1
arch=('x86_64')
license=('MIT')
url="https://github.com/sandreas/m4b-tool"
makedepends=()
depends=('ffmpeg'
    'libmp4v2'
    'php'
    'php-intl'
    'fdkaac'
)
optdepends=('ffmpeg-libfdk_aac: to use fdkaac in conversions')
options=('!strip')
source=("m4b-tool.tar.gz::https://github.com/sandreas/m4b-tool/files/6598116/m4b-tool.tar.gz")


pkgver() {
  cd ${srcdir}
  _dat=`stat --format=%y m4b-tool.phar | awk -F ' |\-' '{ print $1$2$3 }'`
  printf "0.4.2~$_dat"
}

package() {
    cd ${srcdir}
	install -Dm 755 m4b-tool.phar "${pkgdir}/usr/local/bin/m4b-tool"
}

sha256sums=('ae3b350ddc4b3037205a8594cd9255c406130fe264cf965f40357927acbc9925')
