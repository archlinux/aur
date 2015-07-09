# $Id: PKGBUILD 83061 2013-01-27 09:45:36Z andrea $
# Maintainer:
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=evilwm
pkgver=1.1.0
pkgrel=1
pkgdesc='Minimalist but usable window manager for the X Window System'
arch=('x86_64' 'i686')
url='http://evilwm.sourceforge.net'
license=('custom')
depends=('libxrandr')
source=("http://www.6809.org.uk/evilwm/$pkgname-$pkgver.tar.gz"
        LICENSE)
sha256sums=('cdc763c875b64ee3734f3cb764249e91ec659f550177ec1bb564304260ef0c75'
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

# vim:set ts=2 sw=2 et:
