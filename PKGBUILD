# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=ogmrip-oggz
pkgver=0.3
pkgrel=1
pkgdesc='Plugin for OGMRip which adds support for the OGG container for ogmrip'
arch=('i686' 'x86_64')
url='http://ogmrip.sourceforge.net/en/plugins.html'
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip>=0.13' 'liboggz')
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/${pkgname}-${pkgver}.tar.gz"
"http://downloads.sourceforge.net/project/ogmrip/${pkgname}/${pkgver}/README"
)
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/$pkgname/README
}

md5sums=('8874c1079267e3f962e3bd4dbc9aa8c8'
         '24ac59562b0a480c0d88ec6e86095b91')
