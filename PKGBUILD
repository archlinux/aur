# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=free42-skins
pkgver=20190727
pkgrel=1
pkgdesc='Skins for the free42 emulator'
arch=('any')
url='http://thomasokken.com/free42/skins/'
license=('GPL')
depends=('free42')
_archivename="free42-skins-$pkgver.zip"
source=("$_archivename::http://thomasokken.com/free42/skins/desktop-skins.zip")
md5sums=('f1ed79cf39ee513cfea22b0ce7693b63')
noextract=("$_archivename")

package() {
    install -dm755 "$pkgdir/usr/share/free42/skins"
    cd "$pkgdir/usr/share/free42/skins"

    # Ehrling42sl and Standard are included in the free42 package as default skins
    bsdtar -xf "$srcdir/$_archivename" --include '*.gif' --include '*.layout' --exclude 'Ehrling42sl.*' --exclude 'Standard.*'

    chmod 644 *.gif *.layout
    chown root:root *.gif *.layout
}
