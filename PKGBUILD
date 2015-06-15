# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=ttf-arphic
pkgver=2
pkgrel=1
pkgdesc="Arphic public licensed fonts"
arch=('any')
url="http://www.arphic.com/tw/index.htm"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unrar')
install=arphic.install
_baseurl="http://www.arphic.com/uploads/Download/font"
source=("${_baseurl}/bsmi00lp.zip"
        "${_baseurl}/bkai00mp.zip"
        "${_baseurl}/gbsn00lp.zip"
        "${_baseurl}/gkai00mp.zip"
        "${_baseurl}/arplmingu20lt.rar"
        "${_baseurl}/arplbaosong2gbklt.rar"
        "${_baseurl}/public_license.rar")
noextract=('arplmingu20lt.rar' 'arplbaosong2gbklt.rar' 'public_license.rar')
md5sums=('97a992f875469e8b3bb31c3ae3ab74f8'
         '077b6d51e3e859347880cc749e79856a'
         '59b1240c282b333efc07c3fbae76f03a'
         '0b8b1e1a4c98f94eb6006d9e831316b5'
         '81d38559acbf8a1ee1630ae26b56b77c'
         'ab1187e9465b6ec492d3f51167047c0e'
         'd5a1ea0c17c6a292abf578339eea5026')

build()
{
    cd "$srcdir"
    unrar x arplmingu20lt.rar
    unrar x arplbaosong2gbklt.rar
    unrar x public_license.rar
}

package()
{
    cd "$srcdir"
    _fid="$pkgdir/usr/share/fonts/TTF/arphic"
    install -m 644 -D BSMI00LP.TTF "$_fid/bsmi00lp.ttf"
    install -m 644 -D BKAI00MP.TTF "$_fid/bkai00mp.ttf"
    install -m 644 -D GBSN00LP.TTF "$_fid/gbsn00lp.ttf"
    install -m 644 -D GKAI00MP.TTF "$_fid/gkai00mp.ttf"
    install -m 644 -D arplmingu20lt.ttf "$_fid/arplmingu20lt.ttf"
    install -m 644 -D arplbaosong2gbklt.ttf "$_fid/arplbaosong2gbklt.ttf"
    install -m 644 -D "ARPHIC PUBLIC LICENSE_20100309.doc" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.doc"
}
