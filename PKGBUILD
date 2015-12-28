# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=dmusic-plugin-neteasecloudmusic-git
_pkgname=dmusic-plugin-neteasecloudmusic
pkgver=20151113
pkgrel=1
pkgdesc="NeteaseCloudMusic Plugin for Deepin Music Player"
arch=("any")
url="https://github.com/wu-nerd/dmusic-plugin-NeteaseCloudMusic"
license=('unknown')
depends=('deepin-music' 'python2-requests' 'python2-crypto')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::'git://github.com/wu-nerd/dmusic-plugin-NeteaseCloudMusic.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
    cd "${srcdir}/${_pkgname}"
    find ./neteasecloudmusic -type f -exec install -Dm644 {} \
        "${pkgdir}/usr/share/deepin-music/plugins/{}" \;
}
