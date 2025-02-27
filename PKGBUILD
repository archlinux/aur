# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: KiYugadgeter <getalotofmail@gmail.com
#_pkgname=
pkgname=python-dogtail-wayland
pkgver=1.0.5
pkgrel=1
epoch=
pkgdesc='GUI test tool and UI automation framework written in Python'
arch=('x86_64')
url='https://gitlab.com/dogtail/dogtail'
license=('GPL-2.0-or-later')
sha256sums=('SKIP')
groups=()
depends=('gnome-ponytail-daemon' 'python' 'python-gobject' 'at-spi2-core')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=('dogtail')
replaces=()
backup=()
options=()
install=
changelog=
source=('https://files.pythonhosted.org/packages/source/d/dogtail/dogtail-1.0.5.tar.gz')
noextract=()
validpgpkeys=()


build() {
    cd "$srcdir/dogtail-$pkgver"
    python3 setup.py build
}


package() {
	cd "$srcdir/dogtail-$pkgver"
    python3 setup.py install --root="$pkgdir"/
    install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}



