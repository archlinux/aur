# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Aaron Lindsay <aaron@aaronlindsay.com>
# Contributor: Tiago Camargo <tcamargo@gmail.com>

pkgname=devkitppc
pkgver=r26
pkgrel=2
pkgdesc='PowerPC toolchain for Nintendo Gamecube/Wii homebrew development'
arch=('i686' 'x86_64')
url="http://www.devkitpro.org/"
license=('GPL')
options=(!strip libtool staticlibs)
depends=('gcc-libs' 'zlib' 'sh' 'expat')
optdepends=('python26: for powerpc-eabi-gdb')
install=$pkgname.install
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/devkitPPC_$pkgver-$CARCH-linux.tar.bz2"
        "$pkgname.sh")
sha256sums=('6bfff450dbf4dc74c14648db7fa3ac173d277507795c8d1f76de6f28bb81ca0e'
            'ac992191c0e509d936c7c576ab4017e596db7b57d06815334117c485f55c70a2')
if [ "$CARCH" == "i686" ]; then
  sha256sums=('5c18994980dcfc4be5ec1bc2bb6a1d2629e3b377fe50b7c64fcb6111771823ca'
              'ac992191c0e509d936c7c576ab4017e596db7b57d06815334117c485f55c70a2')
fi

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r devkitPPC "$pkgdir"/opt/devkitpro

  install -Dm755 devkitppc.sh "$pkgdir"/etc/profile.d/devkitppc.sh
}
