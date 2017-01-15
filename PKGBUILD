# Maintainer: Juliette Monsel <j_4321@protonmail.com>
pkgname=bracelet-generator
pkgver=1.4.0
pkgrel=1
pkgdesc="Friendship bracelet pattern designer"
arch=('any')
url="https://braceletgenerator.sourceforge.io/"
license=('GPL3')
makedepends=('python-setuptools' )
depends=('tk' 'python-pillow' 'gettext' 'desktop-file-utils' 'shared-mime-info')
optdepends=('ghostscript: export pattern to .png or .jpeg',
            'zenity: nicer file browser and color chooser')
source=("$pkgname-$pkgver-src.tar.xz::https://sourceforge.net/projects/braceletgenerator/files/BraceletGenerator-1.4/$pkgname-$pkgver-src.tar.xz/download")
sha512sums=('5d97d3c970cdf649f9f2ab39b81301b54f931af001ea2b793b340960d3ec1823321211a7576594a0f564963379a318ed9fb2c2f76d796a393b88ddc7c5bba83a')
package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
    install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 bracelet-generator.sharedmimeinfo  "${pkgdir}/usr/share/mime/packages/bracelet-generator.xml"
}
