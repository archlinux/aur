# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
pkgname=aut2exe-docs
pkgver=3.3.14.0
pkgrel=1
pkgdesc='AutoIt documentation'
arch=('any')
url='http://www.autoitscript.com/'
license=('custom')
depends=('xchm')
optdepends=('aut2exe: au3 to exe compiler')
source=("https://www.autoitscript.com/cgi-bin/getfile.pl?autoit3/autoit-v3.zip"
        "http://www.autoitscript.com/autoit3/docs/license.htm"
        "aut2exe_help.sh")
md5sums=('dd05a73ea361037181ad28aeb692647f'
         '4aac1e01ecb674855ac3cf9eda0abda9'
         '144e361393a7025997d7200ef3f9dac4')

package() {
  cd install

  install -Dm644 AutoIt.chm "$pkgdir/usr/share/doc/$pkgname/AutoIt.chm"
  cp -r Examples "$pkgdir/usr/share/doc/$pkgname/examples"
  find "$pkgdir/usr/share/doc/$pkgname" -type d -exec chmod 755 {} \;

  cd "$srcdir"

  install -Dm755 aut2exe_help.sh "$pkgdir/usr/bin/aut2exe_help"
  install -Dm644 license.htm "$pkgdir/usr/share/licenses/$pkgname/license.html"
}

# vim:set ts=2 sw=2 et:
