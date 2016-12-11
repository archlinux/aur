# Maintainer: Juliette Monsel <j_4321@hotmail.fr>
pkgname=checkmails
pkgver=1.1.0
pkgrel=2
pkgdesc="System tray unread mail checker using IMAP protocol"
arch=('any')
url="https://sourceforge.net/projects/checkmails"
license=('GPL3')
depends=('tktray' 'python-pillow' 'python-crypto' 'gettext' 'desktop-file-utils' 'libnotify')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/checkmails/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download" 
        "${pkgname}-${pkgver}.tar.gz.sig::https://sourceforge.net/projects/checkmails/files/${pkgver}/${pkgname}-${pkgver}.tar.gz.sig/download")
sha512sums=('45fa2257cc13fd8900a5d9069d88f521aef4f9da7f201e14048092b38f76e15e6bc33a1ab2a4e521506fb08eadd8f4c0bd246b52e0212e4d25ae845024973d7a'
            '1b99cd5883267b440ff79ce8b220d397fe28e5b2e43757f4bf25911483b0ba26cad303386d8adb3be2c2dec5ed472fbb8ac4bf7ffd6d0a83cc0773907bac7da4')
validpgpkeys=('29D53CB6B3FE203A89F3E65A644700E38E8B4341')  #  Juliette Monsel
package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
