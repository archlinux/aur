# Maintainer: Juliette Monsel <j_4321@protonmail.com>
pkgname=synchronisation
pkgver=1.1.1
pkgrel=3
pkgdesc="Folder synchronisation software"
arch=('any')
url="https://sourceforge.net/projects/synchronisation/"
license=('GPL3')
depends=('python3' 'python-pyside' 'gettext' 'desktop-file-utils')
source=("Synchronisation-linux-$pkgver.tar.gz::https://sourceforge.net/projects/synchronisation/files/$pkgver/Synchronisation-linux-$pkgver.tar.gz/download")
sha512sums=('1928b87c452ff67f6380b42d84e91dda9384208d86efe6deb9e028dcf21c20a7926e9263bab4f21e29312896c329e917d50617fb36f4e2ebe8f955926aa161d0')

package() {
 cd "$srcdir/Synchronisation-$pkgver"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
