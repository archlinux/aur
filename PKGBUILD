# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=checkmails
pkgver=1.1.2
pkgrel=1
pkgdesc="System tray unread mail checker using IMAP protocol"
arch=('any')
url="https://sourceforge.net/projects/checkmails"
license=('GPL3')
depends=('tktray' 'python-pillow' 'python-crypto' 'gettext' 'desktop-file-utils' 'libnotify')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/checkmails/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha512sums=('d37d044ae4d87d73e7423b5eb0b7c3537fa3c7fef65d52343b00d61880bcd4a28b0b145cc9d3015bfd00a4cdb3a4620f55764a650795c8574e07ca4ad1b8814e')

package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
