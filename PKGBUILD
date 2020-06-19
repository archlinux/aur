# Maintainer: Robert Ma (Hexcles) <bob1211@gmail.com>
# Based on (now obsolete) ttf-arphic by Auguste Pop <auguste [at] gmail [dot] com>

pkgname=ttf-arphic-extra
pkgver=20190327
pkgrel=3
pkgdesc="Extra fonts released under revised Arphic Public License for non-profit use only"
arch=('any')
url="http://www.arphic.com.tw/2019/03/27/%E6%96%87%E9%BC%8E%E5%85%AC%E7%9C%BE%E6%8E%88%E6%AC%8A%E5%AD%97%E5%9E%8B/"
license=('custom:Arphic_Public_License_nonprofit')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
_baseurl="http://www.arphic.com.tw/wp-content/uploads/2019/03"
source=("${_baseurl}/arplmingu20lt.zip"       # MingU20 Light
        "${_baseurl}/arplbaosong2gbklt.zip")  # BaoSong2GBK Light
noextract=('arplmingu20lt.zip' 'arplbaosong2gbklt.zip')
sha256sums=('8f8af623ee58817a861558fd30471dd82d0644141fccb692f958b4f558f2c2ff'
            '249c6f192801f530b83df056b0f0b88519d5c00f80b983e70bf557f4fd429491')

prepare()
{
    unzip -o arplmingu20lt.zip
    unzip -o arplbaosong2gbklt.zip
}

package()
{
    cd "${srcdir}"
    _fdir="${pkgdir}/usr/share/fonts/TTF"
    install -m 644 -D arplmingu20lt/arplmingu20lt.ttf "${_fdir}/arplmingu20lt.ttf"
    install -m 644 -D arplbaosong2gbklt/arplbaosong2gbklt.ttf "${_fdir}/arplbaosong2gbklt.ttf"
}
