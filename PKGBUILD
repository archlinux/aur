# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='A command line utility to merge, split and chapterize audiobook files such as mp3, ogg, flac, m4a or m4b'
pkgname=('m4b-tool-bin')
pkgver=0.4.2~20230214
pkgrel=2
arch=('x86_64')
license=('custom:MIT')
url="https://github.com/sandreas/m4b-tool"
makedepends=()
depends=(
  'ffmpeg'
  'libmp4v2'
  'php'
)
provides=('m4b-tool')
conflicts=('m4b-tool')
optdepends=(
  'fdkaac: to use fdkaac in conversions'
  'ffmpeg-libfdk_aac: to use fdkaac in conversions'
  'tone')
options=('!strip')
source=("m4b-tool.tar.gz::https://github.com/sandreas/m4b-tool/files/10728378/m4b-tool.tar.gz"
  "https://raw.githubusercontent.com/sandreas/m4b-tool/03043298eb477d925c50ba81097b0cf43558738e/LICENSE")


pkgver() {
  cd ${srcdir}
  # _dat=`stat --format=%y m4b-tool.phar | awk -F ' |\-' '{ print $1$2$3 }'`
  _dat=`date -u -r m4b-tool.phar -Idate| awk -F '\-' '{ print $1$2$3 }'`
  printf "0.4.2~$_dat"
}

package() {
    cd ${srcdir}
	install -Dvm 755 m4b-tool.phar "${pkgdir}/usr/bin/m4b-tool"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

sha256sums=('181fb3e332849ea704ef860aaabaf9dcab2fdab298ffba99e66d31efa18b02f2'
            'f4e10d52874360d5da10907ef1179e7064fbb1b1d51d1d548bb73d91afcfb65e')
