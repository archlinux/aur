# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Victor Fuentes <hyruleterminatriforce@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
pkgname=gtk-chat
pkgver=0.1
pkgrel=1
pkgdesc='A OICQ Client By GTK4'
arch=('any')
url='https://gitlab.com/weiliang1503/gtk-chat'
license=('GPL3')
depends=()
makedepends=('git' 'meson' 'ninja' 'vala' 'gcc' 'cmake' 'gtk4')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/weiliang1503/gtk-chat.git')
sha256sums=('SKIP')

build() {
cd gtk-chat/
meson build && cd build && ninja
mv $srcdir/$pkgname/build/gchat $srcdir/$pkgname/build/gtk-chat
}

package() {
mkdir -p $pkgdir/usr/bin
install -Dm755 $srcdir/$pkgname/build/gtk-chat -t $pkgdir/usr/bin/
}
