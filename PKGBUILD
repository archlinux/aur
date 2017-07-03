# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# https://github.com/FabioLolix

pkgname=polo
pkgrel=1
pkgver=17.7
_betaver=beta.8
pkgdesc="GTK file manager, currently in beta"
arch=('i686' 'x86_64')
url="http://www.teejeetech.in/"
license=('GPL2')
depends=('gtk3' 'libgee' 'libsoup' 'vte3')
optdepends=('mediainfo'
            'fish'
            'perl-image-exiftool'
            'pv'
            'pdftk'
            'ffmpeg'
            'polo-donation-plugins')
provides=('polo')
conflicts=('polo')
options=(emptydirs)
source=(https://github.com/teejee2008/polo/archive/v${pkgver}-${_betaver}.tar.gz)
md5sums=('77d58e5d66f9a85f6dce529046009cd9')

package() {
  cd $srcdir/$pkgname-$pkgver-$_betaver
  make
  make DESTDIR=$pkgdir install

  install -d $pkgdir/usr/bin
  ln -s /usr/bin/polo-gtk $pkgdir/usr/bin/polo
}
