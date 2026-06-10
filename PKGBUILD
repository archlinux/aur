# Maintainer: matthewq337 <matt at mattquintanilla dot xyz>
# Contributor: iamawacko <iamawacko@protonmail.com>
# Contributor: Nep_Nep <nepnep91 at child dot pizza>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=simplex-desktop-bin
pkgver=6.5.4
pkgrel=2
pkgdesc='SimpleX Chat, the first messaging network operating without user identifiers of any kind (pre-compiled)'
arch=('x86_64')
provides=('simplex-desktop')
conflicts=('simplex-desktop')
url='https://simplex.chat/'
license=('AGPL-3.0-or-later')
source=("$pkgname-$pkgver.deb::https://github.com/simplex-chat/simplex-chat/releases/download/v$pkgver/simplex-desktop-ubuntu-22_04-x86_64.deb")
# SHA512 digest taken from release page on Microsoft GitHub
sha512sums=('c703b083a240d4d803f4bb2d38ef2ab5ceef087cbf26105d3871fd00cb815faa068b3d8783ff85bb81d02cd07d0f4a87472dc21aed7bbd6af29b0625f43b00c1')

depends=(
    'alsa-lib'
    'e2fsprogs'
    'fontconfig'
    'freetype2'
    'fribidi'
    'gmp'
    'harfbuzz'
    'jack2'
    'java-runtime'
    'libdrm'
    'libglvnd'
    'libgpg-error'
    'libusb'
    'libx11'
    'libxcb'
    'libxext'
    'libxi'
    'libxrender'
    'libxtst'
    'openssl'
    'xdg-utils'
    'zlib'
)


options=('!debug' '!strip')


package() {
    cd "$srcdir"

    tar --zstd -xvf data.tar.zst -C "$pkgdir"

    mkdir -p "$pkgdir/usr/share/applications"
    ln -s /opt/simplex/lib/simplex-simplex.desktop "$pkgdir/usr/share/applications/simplex.desktop"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/simplex/bin/simplex "$pkgdir/usr/bin/simplex-desktop"
}
