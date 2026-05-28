# Maintainer: chromaticpipe <chromaticpipe at gmail dot com>

pkgname="srb2bld"
pkgver=2026_04_26
pkgrel=1
pkgdesc='POSIX shell script that eases compiling, installing or creating AppImage/Flatpak/App Bundle/Android APKs of Sonic Robo Blast 2 related builds.'
arch=('any')
license=('MIT')
url='https://github.com/Bijman/srb2bld'
depends=('git' 'make' 'coreutils' 'which' 'findutils' 'inetutils' 'ncurses' 'curl' 'gawk' 'docker' 'stow' 'gdk-pixbuf2' 'flatpak' 'flatpak-builder')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/Bijman/srb2bld/archive/refs/tags/${pkgver//_/-}.zip")
md5sums=('7830cd4516382da3006ff1dab5c01295')  

package ()
{
    cd srb2bld-${pkgver//_/-}
    sudo make install PREFIX=/usr
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
