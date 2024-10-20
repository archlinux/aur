# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Brian BIdulock <bidulock@openss7.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=evilwm
pkgver=1.4.3
pkgrel=1
pkgdesc='Minimalist but usable window manager for the X Window System'
arch=('x86_64' 'i686')
url='https://evilwm.sourceforge.net'
license=('custom')
depends=('libxrandr')
source=("https://www.6809.org.uk/evilwm/dl/$pkgname-$pkgver.tar.gz"
        LICENSE)
sha256sums=('d5945b20b12c91db2412fac0dbda3fb9c3ec8debb8e1b109838992b2b1bbe5d4'
            '50463448057ce7e65276926e9462f5c8bd5f6c6628f2c42ad0cd8a6373d419e1')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" desktopfilesdir=/usr/share/xsessions install
  install -D -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
