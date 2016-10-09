# Maintainer: Juliette Monsel <j_4321@hotmail.fr>
pkgname=checkmails
pkgver=1.0.0
pkgrel=1
pkgdesc="System tray unread mail checker using IMAP protocol"
arch=('any')
url="https://sourceforge.net/projects/checkmails"
license=('GPL3')
depends=('tktray' 'python-pillow' 'python-crypto' 'gettext' 'desktop-file-utils' 'libnotify')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/checkmails/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
md5sums=('978beb7b636b50e2660feab1d37f33a3')
package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
