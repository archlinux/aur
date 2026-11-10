# Maintainer: matthewq337 <matt at mattquintanilla dot xyz>
# Contributor: iamawacko <iamawacko@protonmail.com>
# Contributor: Nep_Nep <nepnep91 at child dot pizza>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=simplex-desktop-bin
pkgver=7.1.2
pkgrel=1
pkgdesc='SimpleX Chat, the first messaging network operating without user identifiers of any kind (pre-compiled)'
arch=('x86_64')
provides=('simplex-desktop')
conflicts=('simplex-desktop')
url='https://simplex.chat/'
license=('AGPL-3.0-or-later')
source=("$pkgname-$pkgver.deb::https://github.com/simplex-chat/simplex-chat/releases/download/v$pkgver/simplex-desktop-ubuntu-22_04-x86_64.deb")
# SHA512 digest taken from release page on Microsoft GitHub
sha512sums=('caa7dd3e9089d106c7f66e7cf589c70882fbf24fbe9d8c112104c6d4b59e739a7ee3c7c6e053af903ea6a7a35daa0aefa70c96beeb23d0101745d7111b25b099')

depends=(
    'alsa-lib'
    'e2fsprogs'
    'fontconfig'
    'freetype2'
    'fribidi'
    'gmp'
    'harfbuzz'
    'jack'
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
