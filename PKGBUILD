# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
# http://www.theneitherworld.com/yumenikki/links.htm
# curl http://www.mediafire.com/download/98jpx2dm3f2te0h/Yume_Nikki.rar | grep -oP 'http://download\d{4}.mediafire.com/\S+/Yume_Nikki.rar'
_pkgname=yumenikki
pkgname=${_pkgname}-en
pkgver=0.10
pkgrel=1
pkgdesc="Surrealistic adventure game about exploring the dreams of a hikikomori character named Madotsuki.Also known as \"Dream Diary\". English Ver."
url='http://www3.nns.ne.jp/pri/tk-mto/'
arch=('any')
license=('custom')
depends=('easyrpg-player')
makedepends=('curl')
source=("yumenikki-en.7z::https://dl.dropbox.com/s/a5dqfazyfrvjr8f/yumenikki-en.7z?dl=1"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('3fb229c2435bc2781b8043a51eea75ec'
         '8cf6b65c9a23295e5492b4bbb612cf56'
         'b8f0addba27f5c18f806c35b933ec8d9'
         '60242abd08aa8eb8f8597ee1911b111d')

         
package() {
  
  install -dm755 "$pkgdir/opt/"
  install -dm755 "$pkgdir/usr/"{bin,share/applications,share/pixmaps}

  
  cp -r "$srcdir/$pkgname" "$pkgdir/opt/$pkgname"
  
  cd "$pkgdir/opt/$pkgname"
  
  install -Dm755 "${srcdir}/${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "${srcdir}/${pkgname}.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

}
