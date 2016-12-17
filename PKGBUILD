# Maintainer: Juliette Monsel <j_4321@protonmail.com>
pkgname=checkmails
pkgver=1.1.0
pkgrel=3
pkgdesc="System tray unread mail checker using IMAP protocol"
arch=('any')
url="https://sourceforge.net/projects/checkmails"
license=('GPL3')
depends=('tktray' 'python-pillow' 'python-crypto' 'gettext' 'desktop-file-utils' 'libnotify')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/checkmails/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha512sums=('45fa2257cc13fd8900a5d9069d88f521aef4f9da7f201e14048092b38f76e15e6bc33a1ab2a4e521506fb08eadd8f4c0bd246b52e0212e4d25ae845024973d7a')

package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
