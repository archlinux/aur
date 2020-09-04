# Maintainer: Ryan Jeffrey <ryan@ryanmj.xyz>
# aka Mallock
pkgname=hyrule-conquest
pkgver=0.8
pkgrel=3
pkgdesc="Hyrule Conquest. Mod for 0ad created by Chasen Lindsey (aka Undying Nephalim)."
arch=(x86_64)
url="https://www.moddb.com/mods/hyrule-conquest"
license=('unknown')
depends=('0ad')
makedepends=('xz' 'curl')
source=('https://www.dropbox.com/s/c3pzx72sarj0hog/hyrule0.8.tar.xz?dl=0')
md5sums=('02513578a96276fc9394a7a756c2d282')
noextract=('hyrule0.8.tar.xz?dl=0')

options=(!strip)

build() {
    mv 'hyrule0.8.tar.xz?dl=0' hyrule0.8.tar.xz
    tar -xvf hyrule0.8.tar.xz
}

package() {
    install -d -m755 $pkgdir/usr/share/0ad/data/mods
    cp -r hc $pkgdir/usr/share/0ad/data/mods/$pkgname
    find $pkgdir/usr/share/0ad/data/mods/$pkgname -type d -exec chmod 755 "{}" \;
    find $pkgdir/usr/share/0ad/data/mods/$pkgname -type f -exec chmod 644 "{}" \;
}
