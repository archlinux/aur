# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=dmusic-plugin-baidumusic-git
_pkgname=dmusic-plugin-baidumusic
pkgver=20140318
pkgrel=1
pkgdesc="BaiduMusic Plugin for Deepin Music Player"
arch=("any")
url="https://github.com/sumary/dmusic-plugin-baidumusic"
license=('unknown')
depends=('deepin-music' 'python2-javascriptcore-git' 'python2-pycurl')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::'git://github.com/sumary/dmusic-plugin-baidumusic.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
    cd "${srcdir}/${_pkgname}"
    find ./baidumusic -type f -exec install -Dm644 {} \
        "${pkgdir}/usr/share/deepin-music/plugins/{}" \;
}
