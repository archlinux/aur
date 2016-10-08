# Maintainer: Juliette Monsel <j_4321@sfr.fr>
pkgname=synchronisation
pkgver=1.1.1
pkgrel=1
pkgdesc="Folder synchronisation software"
arch=('any')
url="https://sourceforge.net/projects/synchronisation/"
license=('GPL3')
depends=('python3' 'python-pyside' 'gettext' 'desktop-file-utils')
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=(!emptydirs)
#changelog=
source=("Synchronisation_linux_$pkgver.tar.gz::https://sourceforge.net/projects/synchronisation/files/$pkgver/Synchronisation-linux-$pkgver.tar.gz/download")
#noextract=()
md5sums=('2d05e78500bee32d2985b485aae35f13')
package() {
 cd "$srcdir/Synchronisation-$pkgver"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
