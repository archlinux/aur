# Maintainer: Roboron <robertoms258 at gmail dot com>

pkgname=nsis-nsisunz-bin
pkgver=1.0
pkgrel=1
pkgdesc="NSIS plugin which allows you to extract files from ZIP archives"
arch=('any') # Does not contain any code that's executed on the host system
url="https://nsis.sourceforge.io/Nsisunz_plug-in"
license=('custom')
depends=('nsis')
source=("Nsisunz-$pkgver.zip::https://nsis.sourceforge.io/mediawiki/images/1/1c/Nsisunz.zip"
		"NsisunzU-$pkgver.zip::https://nsis.sourceforge.io/mediawiki/images/5/5a/NSISunzU.zip"
		'LICENSE')
sha256sums=('599029776df526def921ea178a6f66325b6f719772c38318e349a5c92a03afe9'
            '8c2b7ad6984e3137e4c51c763ec64cbd36364e72838b85e14fa287dac976c46b'
            '0945bd475c5ef7df1499f1157274f0eed63cedae29bacd6db3bc579b91668b74')

package() {
  install -D "$srcdir"/nsisunz/Release/nsisunz.dll "$pkgdir"/usr/share/nsis/Plugins/x86-ansi/nsisunz.dll
  install -D "$srcdir"/NSISunzU/Plugin\ unicode/nsisunz.dll "$pkgdir"/usr/share/nsis/Plugins/x86-unicode/nsisunz.dll
  install -D "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
