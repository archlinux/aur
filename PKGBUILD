# Maintainer: matthewq337 <matt at mattquintanilla dot xyz>
# Contributor: Nep_Nep <nepnep91 at child dot pizza>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=simplex-desktop-bin
pkgver=6.0.4
pkgrel=2
pkgdesc='SimpleX Chat, the first messaging network operating without user identifiers of any kind (pre-compiled)'
arch=('x86_64')
url='https://simplex.chat/'
license=('AGPL-3.0-or-later')
source=("$pkgname-$pkgver.deb::https://github.com/simplex-chat/simplex-chat/releases/download/v$pkgver/simplex-desktop-ubuntu-22_04-x86_64.deb")
# SHA512 digest taken from release page on Microsoft GitHub
sha512sums=('4611bea8a7877ba68c1f09ef04a76d60943ce6aa2a24044034cea9f3baad1fddee277e13c96faa5f071284d07ea3d9d65acc4d6a1833876c47e588c2e4dee37d')

package() {
    cd "$srcdir"

    tar --zstd -xvf data.tar.zst -C "$pkgdir"

    mkdir -p "$pkgdir/usr/share/applications"
    ln -s /opt/simplex/lib/simplex-simplex.desktop "$pkgdir/usr/share/applications/simplex.desktop"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/simplex/bin/simplex "$pkgdir/usr/bin/simplex-desktop"
}
