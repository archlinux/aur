# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=mynotes
pkgver=2.0.0
pkgrel=1
pkgdesc="Desktop post-it / sticky notes managed from system tray icon"
arch=('any')
url="https://sourceforge.net/projects/my-notes"
license=('GPL3')
depends=('tktray' 'python-ewmh' 'gettext' 'desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/my-notes/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download")
sha512sums=('538196d21d9f0d7acbd5c4c9b3e6d2830dd1b7c80f953ab638b847a59b528a5c8f74f15debcc16f4c3f0907680b4e27a0e92871500ce7040bf4553f29c7637fb')

package() {
 cd "$srcdir/${pkgname}-${pkgver}"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
