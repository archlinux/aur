# Maintainer: Jari Vetoniemi <mailroxas _at_ gmail >
pkgname=dmenu-pango
pkgver=4.5
pkgrel=3
pkgdesc="Dynamic X menu - with pango support"
url="http://tools.suckless.org/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft' 'pango')
conflicts=('dmenu' 'dmenu-xft')
provides=('dmenu')
source=(http://dl.suckless.org/tools/dmenu-$pkgver.tar.gz
        dmenu-4.5-pango.patch)
md5sums=('9c46169ed703732ec52ed946c27d84b4'
         'a11076145db77597cf6c2e184c97c0d4')

build() {
	cd $srcdir/dmenu-$pkgver
	patch -p1 < ../dmenu-$pkgver-pango.patch
	make
}
package()
{
    cd "$srcdir/dmenu-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

