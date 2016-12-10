# Maintainer: Juliette Monsel <j_4321@protonmail.com>
pkgname=bracelet-generator
pkgver=1.3.1
pkgrel=2
pkgdesc="A friendship bracelet pattern designer"
arch=('any')
url="http://braceletgenerator.sourceforge.net/index.html"
license=('GPL3')
depends=('python2' 'tk' 'python-pillow' 'gettext' 'desktop-file-utils')
optdepends=('ghostscript: export pattern to .png or .jpeg',
            'zenity: nicer file browser and color chooser')
install=$pkgname.install
#changelog=
source=("$pkgname-$pkgver-archlinux-src.tar.xz::https://sourceforge.net/projects/braceletgenerator/files/BraceletGenerator-1.3/$pkgname-$pkgver-archlinux-src.tar.xz/download" "https://sourceforge.net/projects/braceletgenerator/files/BraceletGenerator-1.3/$pkgname-$pkgver-archlinux-src.tar.xz.sig/download")
sha512sums=('36aaf73c6112bdcfda2fa7e3c1454ca6d57acf92cce8bf9b2c2b13638db521681ce857e99ad7bbbe32fbe667e47821fbe4d43bac51533b8d230ead1581704c49'
            '389c3be6be117ec6dd6af294ac5926698b158486a6ada92c5042fe9bd02b0410b31b769e2781ae0cb4f3a4c11409fb68147895325c6f046100c59fde7de4bbe8')
validpgpkeys=('29D53CB6B3FE203A89F3E65A644700E38E8B4341')  #  Juliette Monsel
package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 $pkgname.desktop "${pkgdir}/usr/share/applications/$pkgname.desktop"
    install -D -m644 $pkgname.svg "${pkgdir}/usr/share/pixmaps/$pkgname.svg"
}
