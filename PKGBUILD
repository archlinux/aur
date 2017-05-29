# Maintainer: 3yan <zelenkaj@vscht.cz>
pkgname=mestrenova
pkgver=11.0.4
pkgrel=1
pkgdesc="Widely used commercial NMR interpreter"
arch=('any')
url="https://www.mestrelab.com"
license=('custom:mestrelab')
depends=('lib32-libltdl' 'lib32-gcc-libs' 'lib32-openssl' 'lib32-zlib' 'lib32-mesa-libgl' 'lib32-glib2' 'lib32-fontconfig' 'lib32-libxrender' 'lib32-libxi' 'lib32-libsm' 'lib32-glu' 'lib32-openssl100')
source=("http://mestrelab.com/downloads/mnova/linux/Debian/8/mestrenova_11.0.4-18998_i386.deb")
        
sha256sums=('7be69d68d487f996c7d1660fbdfffa1bce8d36d20437b55ac6bcb1ee0710a490')

package() {
tar -xvf data.tar.gz
cp -R opt ${pkgdir}/opt

    install -Dm755 $pkgdir/opt/MestReNova/menu/MestReNova.desktop $pkgdir/usr/share/applications/MestReNova.desktop
    install -Dm644 $pkgdir/opt/MestReNova/license.pdf $pkgdir/usr/share/licenses/$pkgname/license.pdf
    install -d $pkgdir/usr/bin
    ln -s $pkgdir/opt/MestReNova/lib/MestReNova $pkgdir/usr/bin/MestReNova
}
