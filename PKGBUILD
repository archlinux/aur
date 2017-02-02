# Maintainer: Robert Ma (Hexcles) <bob1211@gmail.com>
# Based on (now obsolete) ttf-arphic by Auguste Pop <auguste [at] gmail [dot] com>

pkgname=ttf-arphic-extra
pkgver=20100309
pkgrel=2
pkgdesc="Extra fonts released under revised Arphic Public License for non-profit use only"
arch=('any')
url="http://www.arphic.com.tw/en/home/index"
license=('custom:Arphic_Public_License_nonprofit')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unrar')
_baseurl="http://www.arphic.com/uploads/Download/font"
source=("${_baseurl}/arplmingu20lt.rar"      # MingU20 Light
        "${_baseurl}/arplbaosong2gbklt.rar"  # BaoSong2GBK Light
        "${_baseurl}/public_license.rar")
noextract=('arplmingu20lt.rar' 'arplbaosong2gbklt.rar' 'public_license.rar')
sha256sums=('2e75608ef3208abc1d9d26b74d4f1e926c88534999b818bb1e3a19330c39ade2'
            '0cac44a3ec50303e374c040485e13a1ecf570c6d835504c50e064734b0300fbf'
            'e20087a5f9b06008dd3639afdc81c469ea56514e11e4e6f849f547bfaa57684d')

prepare()
{
    unrar x -o+ -inul arplmingu20lt.rar
    unrar x -o+ -inul arplbaosong2gbklt.rar
    unrar x -o+ -inul public_license.rar
}

package()
{
    cd "${srcdir}"
    _fdir="${pkgdir}/usr/share/fonts/TTF"
    install -m 644 -D arplmingu20lt.ttf "${_fdir}/arplmingu20lt.ttf"
    install -m 644 -D arplbaosong2gbklt.ttf "${_fdir}/arplbaosong2gbklt.ttf"
    install -m 644 -D "ARPHIC PUBLIC LICENSE_20100309.doc" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.doc"
}
