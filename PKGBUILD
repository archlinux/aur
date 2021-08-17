# Maintainer: kXuan <kxuanobj at gmail dot com>
pkgname=netease-cloud-music
pkgver=1.2.1
_pkgdate=20190428
pkgrel=2
pkgdesc="Netease Cloud Music, converted from .deb package"
arch=("x86_64")
url="https://music.163.com/"
license=('custom')
depends=()
source=(
	"https://d1.music.126.net/dmusic/netease-cloud-music_${pkgver}_amd64_ubuntu_${_pkgdate}.deb"
	"https://music.163.com/html/web2/service.html"
)
md5sums=('1f47c7dc3d9ce46da8099e539ee8a74d'
         'ee09cacb054f6a346bf935737df3f33d')

DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {
  cd ${srcdir}
  tar -xvf data.tar.xz -C ${pkgdir}
  install -D -m644 service.html ${pkgdir}/usr/share/licenses/$pkgname/license.html
}
