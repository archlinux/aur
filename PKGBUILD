# Maintainer: qzwlecr <qzwlecr@gmail.com>

pkgname=netease-cloud-music-docker-version
pkgver=1.0.0_2
pkgrel=2
pkgdesc="An online music player by netease. Run on docker to avoid bugs."
arch=('i686' 'x86_64')
url="https://github.com/qzwlecr/netease-cloud-music-docker-version"
install="netease-cloud-music-docker-version.install"
depends=('docker' 'bash' 'xorg-xhost')
conflicts=('netease-cloud-music')
source=(
    "http://s1.music.126.net/download/pc/netease-cloud-music_1.0.0-2_amd64_ubuntu16.04.deb"
    "http://music.163.com/html/web2/service.html"
    "https://raw.githubusercontent.com/qzwlecr/netease-cloud-music-docker-version/master/netease-cloud-music"
)
md5sums=('d9a6fa79ffcb654254a1d8b7ba5901a3'
         'SKIP'
         'SKIP')

package() {
    cd ${srcdir}
    tar -xvf data.tar.xz -C ${pkgdir}
    install -D -m644 service.html ${pkgdir}/usr/share/licenses/$pkgname/license.html
    install -m755 netease-cloud-music ${pkgdir}/usr/bin/netease-cloud-music
    rm -rf ${pkgdir}/usr/lib/netease-cloud-music
}
