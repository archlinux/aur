# Maintainer: Juliette Monsel <j_4321@hotmail.fr>
pkgname=checkmails
pkgver=1.1.0
pkgrel=1
pkgdesc="System tray unread mail checker using IMAP protocol"
arch=('any')
url="https://sourceforge.net/projects/checkmails"
license=('GPL3')
depends=('tktray' 'python-pillow' 'python-crypto' 'gettext' 'desktop-file-utils' 'libnotify')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/checkmails/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download" 
        "${pkgname}-${pkgver}.tar.gz.sig::https://sourceforge.net/projects/checkmails/files/${pkgver}/${pkgname}-${pkgver}.tar.gz.sig/download")
sha512sums=('1406a60a15383d38bb7b4781713fcbf138b2a16ee4398eac22a2880bc506ef013bef33605c56c084e18985490c01ef904146201b948750cdd138d03f1b57297d'
            'f0dbebb86d6f660b3641dc4728a3295d5a7831ac7424aef82b29f32406c6986bd535c2db90b9d3e6cca89fb318ce16cc803dfc11c53e4844b1b20211eae91df0')
validpgpkeys=('29D53CB6B3FE203A89F3E65A644700E38E8B4341')  #  Juliette Monsel
package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
