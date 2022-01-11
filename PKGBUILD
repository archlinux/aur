# Maintainer: Roboron <robertoms258 at gmail dot com>

pkgname=nsis-shelllink-bin
pkgver=1.2
pkgrel=1
pkgdesc="NSIS plugin that allows you to read and change shell link (.lnk) files"
arch=('any') # Does not contain any code that's executed on the host system
url="https://nsis.sourceforge.io/ShellLink_plug-in"
license=('custom')
depends=('nsis')
source=("ShellLink-$pkgver.zip::https://nsis.sourceforge.io/mediawiki/images/6/6c/Shelllink.zip"
		'LICENSE')
sha256sums=('789bc4610272f8b01de8e2889987d50c7dd401193a90350184e58cb4c26393b9'
            '4af69618123057702c0c8cea990bae7e1c72e030d7a10e0f35056f0afa3d9fcf')

package() {
  install -D "$srcdir"/Plugins/ShellLink.dll "$pkgdir"/usr/share/nsis/Plugins/x86-ansi/ShellLink.dll
  install -D "$srcdir"/Unicode/Plugins/ShellLink.dll "$pkgdir"/usr/share/nsis/Plugins/x86-unicode/ShellLink.dll
  install -D "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
