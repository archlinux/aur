# Maintainer: Juliette Monsel <j_4321 [at] protonmail [dot] com>
pkgname=mynotes
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop post-it / sticky notes managed from system tray icon"
arch=('any')
url="https://sourceforge.net/projects/my-notes"
license=('GPL3')
depends=('tktray' 'python-ewmh' 'gettext' 'desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/my-notes/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha512sums=('68cbfc521b20161610f8db0872d273363160ea250eb5592e281a002670bcbe7e013a2fcc02b0135a18b3c369f0573ba05f32a6a0cab7ad3848c0e65b58393210')

package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
