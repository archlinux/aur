# Maintainer: Martynas Mickevičius <mmartynas at gmail dot com>
_version=2.01
_build=00161

pkgname=ccpkip11
pkgver="$_version.$_build"
pkgrel=1
pkgdesc="PKCS #11 driver for CryptoTech smart cards"
arch=('x86_64')
url="http://www.cryptotech.com.pl/Produkty/CryptoCard_Suite_Pobieranie,content.html"
license=('custom')
depends=('pcsclite')
source=(ccs_$_version-$_build.amd64.deb::"http://download.cryptotech.com.pl/?key=standardlinuxccs64&mode=2"
        'LICENSE')
md5sums=('9e334b3451e1e24c3de8697ea502b316'
         '4573b427fb59055e9e6b8db84d9e1d00')

package() {
  ar xf "ccs_$_version-$_build.amd64.deb"
  tar xfz "data.tar.gz"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "usr/lib/ccs/libccpkip11.so.$pkgver" "${pkgdir}/usr/lib/libccpkip11.so"
}
