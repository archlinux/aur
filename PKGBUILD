# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
_pkgname=yumenikki
pkgname=${_pkgname}-jp
pkgver=0.10
pkgrel=1
pkgdesc="Surrealistic adventure game about exploring the dreams of a hikikomori character named Madotsuki.Also known as \"Dream Diary\". Original Ver(Japanese)."
url='http://www3.nns.ne.jp/pri/tk-mto/'
arch=('any')
license=('custom')
depends=('easyrpg-player' 'rpg2003-rtp')
makedepends=('unarchiver' 'convmv')
source=("http://ftp.vector.co.jp/43/88/3084/${_pkgname}${pkgver}.lzh"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('f3a16c395078dcec4950200732bc5194'
         'dbffbb59e18b8c4d22688134b42cf70f'
         'b8f0addba27f5c18f806c35b933ec8d9'
         'b771b2a649f91dfef9075d9dcc03107e')
noextract=${_pkgname}${pkgver}.lzh

prepare() {
  cd "${srcdir}"
  unar "$srcdir/${_pkgname}${pkgver}.lzh"
}

package() {
  
  install -dm755 "$pkgdir/opt/"
  install -dm755 "$pkgdir/usr/"{bin,share/applications,share/pixmaps}
  #cd "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/ゆめにっき/ゆめにっき0.10/" "$pkgdir/opt/$pkgname"
  cp "$srcdir/ゆめにっき/初めに読んで下さい。0.10.txt" "$pkgdir/opt/$pkgname"
  echo "Read \"/opt/${pkgname}/初めに読んで下さい。0.10.txt\"." > "$pkgdir/opt/$pkgname/LICENSE"
  
  cd "$pkgdir/opt/$pkgname"
  
  install -Dm755 "${srcdir}/${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "${srcdir}/${pkgname}.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

}
