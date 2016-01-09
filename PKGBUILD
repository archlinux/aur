# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
pkgname=aut2exe
pkgver=3.3.14.0
pkgrel=1
pkgdesc='AutoIt compiler'
arch=('any')
url='http://www.autoitscript.com/'
license=('custom')
depends=('wine')
optdepends=('aut2exe-docs: help files and sample code')
source=("https://www.autoitscript.com/cgi-bin/getfile.pl?autoit3/autoit-v3.zip"
        "http://www.autoitscript.com/autoit3/docs/license.htm"
        "aut2exe.sh")
md5sums=('dd05a73ea361037181ad28aeb692647f'
         '4aac1e01ecb674855ac3cf9eda0abda9'
         '4b9636dd42c12a66b586da8daf25c20c')

package() {
  cd install/Aut2Exe

  install -Dm644 Aut2exe.exe "$pkgdir/usr/bin/Aut2exe.exe"
  install -Dm644 upx.exe "$pkgdir/usr/bin/upx.exe"
  install -Dm755 "$srcdir/aut2exe.sh" "$pkgdir/usr/bin/aut2exe"
  install -Dm644 "$srcdir/license.htm" \
    "$pkgdir/usr/share/licenses/$pkgname/license.html"
}

# vim:set ts=2 sw=2 et:
