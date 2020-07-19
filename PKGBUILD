# Maintainer: mars <gzhqyz at gmail dot com>
# Contributor: Peter Cai <peter at typeblog dot net>
# Contributor: Mike Tong <3344907598 [AT] qq.com>

# ref:
#   https://github.com/archlinuxcn/repo/pull/1260
#   https://github.com/laomocode/netease-cloud-music
#   https://github.com/ZetaoYang/netease-cloud-music-appimage
#   http://mirrors.ustc.edu.cn/deepin/pool/main/n/netease-cloud-music/

pkgname=netease-cloud-music-imfix
_pkgname=netease-cloud-music
pkgver=1.2.1
_pkgdate=20190428
pkgrel=2
pkgdesc='Netease Cloud Music, converted from .deb package, with IBus input method support'
arch=(x86_64)
url='http://music.163.com'
license=(custom)
depends=(gtk2)
provides=('netease-cloud-music')
conflicts=('netease-cloud-music')
source=(
  'http://music.163.com/html/web2/service.html'
  "http://d1.music.126.net/dmusic/netease-cloud-music_${pkgver}_amd64_ubuntu_${_pkgdate}.deb"
)
sha256sums=('cf307fee4be224223ed8cf5af5e8708960683564cd05c53108fa3c382c029a0e'
            '1ee9f02842e6c2c8c79c48b2e932074f9c213a8eb4238e5e63f20438562fecbb')

package() {
  cd ${srcdir}
  optdir='opt/netease/netease-cloud-music'
  tar --exclude="${optdir}/libs/libgdk-x11-2.0.so.0" \
      --exclude="${optdir}/libs/libgtk-x11-2.0.so.0" \
      -Jxf data.tar.xz -C ${pkgdir}
  install -D -m644 service.html ${pkgdir}/usr/share/licenses/${_pkgname}/license.html
}
