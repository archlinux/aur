# Maintainer: Ryan Jeffrey <ryan@ryanmj.xyz>
# aka Mallock
pkgname=hyrule-conquest
pkgver=0.8
pkgrel=2
pkgdesc="Hyrule Conquest. Mod for 0ad created by Chasen Lindsey (aka Undying Nephalim)."
arch=(x86_64)
url="https://www.moddb.com/mods/hyrule-conquest"
license=('unknown')
depends=('0ad')
makedepends=('xz' 'curl')
source=('https://www.dropbox.com/s/c3pzx72sarj0hog/hyrule.tar.xz?dl=0')
md5sums=('23c5e3402ff13433409a1d149b54b83c')
noextract=('hyrule.tar.xz?dl=0')

options=(!strip)

build() {
    mv 'hyrule.tar.xz?dl=0' hyrule.tar.xz
    tar -xvf hyrule.tar.xz
}

package() {
    install -d -m755 $pkgdir/usr/share/0ad/data/mods
    cp -r Hyrule $pkgdir/usr/share/0ad/data/mods/$pkgname
    find $pkgdir/usr/share/0ad/data/mods/$pkgname -type d -exec chmod 755 "{}" \;
    find $pkgdir/usr/share/0ad/data/mods/$pkgname -type f -exec chmod 644 "{}" \;
}
