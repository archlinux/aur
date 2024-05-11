pkgname=ioq3-bin
pkgver=5a918bf
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_i686=1
_pkgrel_aarch64=1
pkgdesc="The ioquake3 community effort to continue supporting/developing id's Quake III Arena"
arch=('x86_64' 'i686' 'aarch64')
url="https://gitlab.com/linuxbombay/ioq3"
license=('GPL')
depends=('curl' 'freetype2' 'libjpeg' 'libvorbis' 'openal' 'opus' 'opusfile' 'sdl2' 'zlib')
makedepends=('unzip')
sha256sums_x86_64=('71a1cba96cc2957afe07636a29ea814798d368101ffed47bba676b8ef3d321c6')
sha256sums_i686=('a9fc45aab90063a8873891e90c637262a8daec66077a8a163253555555607807')
sha256sums_aarch64=('f49c26e9d3a5d04d82d9b679ad64c7b2c0d3d1a0f0718b92b6b28dba9ffbc27a')
source_x86_64=("$url/$pkgver/-/raw/main/ioq3-linux-x64.tar.xz")
source_i686=("$url/$pkgver/-/raw/main/ioq3-linux-i686.tar.xz")
source_aarch64=("$url/$pkgver/-/raw/main/ioq3-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/share/games/ioq3"
    install -dm755 "$pkgdir/usr/bin"
    cd $srcdir
    rm -rf *.tar.xz
    cp -r ./ "$pkgdir/usr/share/games/ioq3"
  #Binaries
    mv "$pkgdir/usr/share/games/ioq3/ioquake3" "$pkgdir/usr/bin"
    mv "$pkgdir/usr/share/games/ioq3/ioq3ded" "$pkgdir/usr/bin"
    ln -s "/usr/bin/ioquake3" "$pkgdir/usr/share/games/ioq3/ioquake3"
    ln -s "/usr/bin/ioq3ded" "$pkgdir/usr/share/games/ioq3/ioq3ded"
}
