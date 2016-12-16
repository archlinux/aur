# Maintainer: Juliette Monsel <j_4321@protonmail.com>
pkgname=synchronisation
pkgver=1.1.1
pkgrel=2
pkgdesc="Folder synchronisation software"
arch=('any')
url="https://sourceforge.net/projects/synchronisation/"
license=('GPL3')
depends=('python3' 'python-pyside' 'gettext' 'desktop-file-utils')
source=("Synchronisation-linux-$pkgver.tar.gz::https://sourceforge.net/projects/synchronisation/files/$pkgver/Synchronisation-linux-$pkgver.tar.gz/download" 
        "Synchronisation-linux-$pkgver.tar.gz.sig::https://sourceforge.net/projects/synchronisation/files/$pkgver/Synchronisation-linux-$pkgver.tar.gz.sig/download")
sha512sums=('1928b87c452ff67f6380b42d84e91dda9384208d86efe6deb9e028dcf21c20a7926e9263bab4f21e29312896c329e917d50617fb36f4e2ebe8f955926aa161d0'
            '9066140372a83ba0d4ccf000fe7cdd7960505fcac6087fdbb16d39b50a40949b02c640f42bcb38d4af6dd0838dd284a41962868474b8a5bc1dede7077f6c60cb')
validpkgkey=('29D53CB6B3FE203A89F3E65A644700E38E8B4341') # Juliette Monsel
package() {
 cd "$srcdir/Synchronisation-$pkgver"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
