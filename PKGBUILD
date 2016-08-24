# Maintainer: Juliette Monsel <j_4321@sfr.fr>
pkgname=bracelet-generator
pkgver=1.3.1
pkgrel=1
pkgdesc="A friendship bracelet pattern designer"
arch=('any')
url="http://braceletgenerator.sourceforge.net/index.html"
license=('GPL3')
depends=('python2' 'tk' 'python-pillow' 'gettext' 'desktop-file-utils')
optdepends=('ghostscript: export pattern to .png or .jpeg',
            'zenity: nicer file browser and color chooser')
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=(!emptydirs)
install=$pkgname.install
#changelog=
source=("$pkgname-$pkgver-archlinux-src.tar.xz::https://sourceforge.net/projects/braceletgenerator/files/BraceletGenerator-1.3/$pkgname-$pkgver-archlinux-src.tar.xz/download")
#noextract=()
md5sums=('71a6e754414764bbf002050a36e0fe80')
package() {
 cd "$srcdir/$pkgname-$pkgver"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
 install -D -m644 $pkgname.desktop "${pkgdir}/usr/share/applications/$pkgname.desktop"
 install -D -m644 $pkgname.svg "${pkgdir}/usr/share/pixmaps/$pkgname.svg"
}
