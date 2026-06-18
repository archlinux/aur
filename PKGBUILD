# Contributor: Nikolai Klover <nick8klover@outlook.com>

pkgname=devilwm
pkgver=1.4.3
pkgrel=1
pkgdesc='Fork of devilwm that adds built-in application launcher support defaulted to dmenu.'
arch=('x86_64' 'i686')
url='https://github.com/catnipsta/devilwm'
license=('custom')
depends=(libxrandr
	 dmenu)
source=("git+https://github.com/catnipsta/devilwm.git"
        LICENSE)
sha256sums=(' '
'fc302a303187ffc836f9379d88f9fafc64b9bd30c8db31768cbfa491ea8e4d36')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" desktopfilesdir=/usr/share/xsessions install
  install -D -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
