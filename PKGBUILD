# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=free42-skins
pkgver=20180223
pkgrel=1
pkgdesc='Skins for the free42 emulator'
arch=('any')
url='http://thomasokken.com/free42/skins/'
license=('GPL')
depends=('free42')
_archivename="free42-skins-$pkgver.zip"
source=("$_archivename::http://thomasokken.com/free42/skins/desktop-skins.zip")
md5sums=('0ecacdd253829902a7bcf4dac873b14e')
noextract=("$_archivename")

package() {
    install -dm755 "$pkgdir/usr/share/free42/skins"
    cd "$pkgdir/usr/share/free42/skins"

    # Ehrling42sl and Standard are included in the free42 package as default skins
    bsdtar -xf "$srcdir/$_archivename" --include '*.gif' --include '*.layout' --exclude 'Ehrling42sl.*' --exclude 'Standard.*'

    chmod 644 *.gif *.layout
    chown root:root *.gif *.layout
}
