# $Id$
# Maintainer: kvaps <kvapss@gmail.com>

pkgname=keepass-wine
pkgver=2.34
pkgrel=3
pkgdesc='A easy-to-use password manager for Windows, Linux, Mac OS X and mobile devices.'
arch=('any')
url='http://keepass.info/'
license=('GPL')
depends=('keepass' 'wine')
source=("http://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkvantage_en/dotnetfx.exe"
        'keepass-wine'
        'keepass-wine.desktop')

sha256sums=('46693d9b74d12454d117cc61ff2e9481cabb100b4d74eb5367d3cf88b89a0e71'
            'e0b2b3bd55cc306e2efd950a2a1fb1837d51259ed6298322727403209fcf395d'
            '685fa3a4e7c9dfcd04bd2be7000bcbbd353c5a1a60f1697c7469e35dd361432d')

validpgpkeys=('D95044283EE948D911E8B606A4F762DC58C6F98E')

package() {
  install -Dm755 keepass-wine "$pkgdir"/usr/bin/keepass-wine
  install -Dm755 dotnetfx.exe "$pkgdir"/usr/share/keepass-wine/dotnetfx.exe

  # Proper installation of .desktop file
  desktop-file-install -m 644 --dir "$pkgdir"/usr/share/applications/ keepass-wine.desktop
}
