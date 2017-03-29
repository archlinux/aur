# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=checkmails
pkgver=1.1.1
pkgrel=1
pkgdesc="System tray unread mail checker using IMAP protocol"
arch=('any')
url="https://sourceforge.net/projects/checkmails"
license=('GPL3')
depends=('tktray' 'python-pillow' 'python-crypto' 'gettext' 'desktop-file-utils' 'libnotify')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/checkmails/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha512sums=('d3ab1b7b3264bcbf051032719f8e96d219f10f38f0c8d8e7c09cfb21a8bdab561ed2041ed1220114bc53fa4f1852052243695239a6be94b0178631c1d8b23160')

package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
