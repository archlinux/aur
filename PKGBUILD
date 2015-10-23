# Maintainer: ilusi0n <ridemetothemoon@gmail.com>
# Contributor: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: AddiKT1ve <the.addikt1ve@gmail.com>

pkgname=wmfs
pkgver=201104
pkgrel=1
pkgdesc="A lightweight and highly configurable tiling window manager for X"
arch=('i686' 'x86_64')
url="http://www.wmfs.info/"
license=('BSD')
depends=('libxft' 'imlib2' 'libxinerama' 'libxrandr')
conflicts=('wmfs-git' 'wmfs2-git')
source=(https://github.com/downloads/xorg62/wmfs/wmfs-201104.tar.gz)
md5sums=('323fa55885d86783f104f936e6b12c75')

build() {
cd "$srcdir/$pkgname-$pkgver"

./configure --prefix /usr \
--man-prefix /usr/share/man \
--xdg-config-dir /etc/xdg
make
}

package() {
cd "$srcdir/$pkgname-$pkgver"

make DESTDIR=${pkgdir} install
install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}