# Maintainer: Martynas Mickevičius <mmartynas at gmail dot com>
_version=2.00
_build=00261

pkgname=ccpkip11
pkgver="$_version.$_build"
pkgrel=1
pkgdesc="PKCS #11 driver for CryptoTech smart cards"
arch=('x86_64')
url="http://www.cryptotech.com.pl/Produkty/CryptoCard_Suite_Pobieranie,content.html"
license=('custom')
depends=('pcsclite')
source=("Linux-$pkgver-x64.zip::http://download.cryptotech.com.pl/?key=standardlinuxccs64&mode=2"
        'LICENSE')
md5sums=('074dd04e523367192d1c2e4e8239075d'
         '4573b427fb59055e9e6b8db84d9e1d00')

package() {
  tar xfz "Linuxx64/ccs_$_version-$_build.amd64.tar.gz"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "ccs_$_version-$_build.amd64/lib/ccs/libccpkip11.so.$pkgver" "${pkgdir}/usr/lib/libccpkip11.so"
}
