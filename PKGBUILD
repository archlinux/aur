# Maintainer: Oshgnacknak <osh@oshgnacknak.de>
pkgname=moodle-sync
pkgver="1.0.61"
pkgrel=1
epoch=
pkgdesc="Moodle platform file synchronization from a desktop app."
arch=('x86_64')
url="https://github.com/MoodleSync/sync-app"
license=('GPL-3.0 license')
groups=()
depends=('jre8-openjdk')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/MoodleSync/sync-app/releases/download/v$pkgver/$pkgname-bundle-$pkgver-linux-x86_64.zip"
        'moodle-sync.desktop')
noextract=()
sha256sums=('1fec2b487c1cc89e0ef27abffd21fbfa34a611b77de482541144b7df62b35cde'
            '4c51246eb5c5a3548f9e0c74222bbf6bd93ae4fbf93704327bb849ee2e943226')

package() {
    cd "$srcdir"
    tree
    mkdir -p $pkgdir/usr/share/applications
    cp -v ./*.desktop $pkgdir/usr/share/applications

    mkdir -p $pkgdir/usr/share/$pkgname
    chmod +x ./bin/*
    cp -rv ./bin ./lib $pkgdir/usr/share/$pkgname

    mkdir -p $pkgdir/usr/bin/
    ln -s /usr/share/$pkgname/bin/moodle-sync-fx $pkgdir/usr/bin/moodle-sync-fx
    ln -s /usr/share/$pkgname/bin/moodle-sync-cli $pkgdir/usr/bin/moodle-sync-cli
}
