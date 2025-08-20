# Maintainer: matthewq337 <matt at mattquintanilla dot xyz>
# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Nep_Nep <nepnep91 at child dot pizza>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=simplex-desktop-bin
pkgver=6.4.3.1
pkgrel=1
pkgdesc='SimpleX Chat, the first messaging network operating without user identifiers of any kind (pre-compiled)'
arch=('x86_64')
url='https://simplex.chat/'
license=('AGPL-3.0-or-later')
source=("$pkgname-$pkgver.deb::https://github.com/simplex-chat/simplex-chat/releases/download/v$pkgver/simplex-desktop-ubuntu-22_04-x86_64.deb")
# SHA512 digest taken from release page on Microsoft GitHub
sha512sums=('05fb28a073189c01d8d28ebe24ea1746a4e1252258c6a05c1c80174352d9b2d3dc6c1e1e390fe79cfc7d116f76b07f29d567a9eadb73ac1514764fab4bfd4510')

package() {
    cd "$srcdir"

    tar --zstd -xvf data.tar.zst -C "$pkgdir"

    mkdir -p "$pkgdir/usr/share/applications"
    ln -s /opt/simplex/lib/simplex-simplex.desktop "$pkgdir/usr/share/applications/simplex.desktop"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/simplex/bin/simplex "$pkgdir/usr/bin/simplex-desktop"
}
