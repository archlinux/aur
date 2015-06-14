# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=ogmrip-dirac
pkgver=0.2
pkgrel=1
pkgdesc='Plugin for OGMRip which enables transcoding to dirac for ogmrip'
arch=('i686' 'x86_64')
url='http://ogmrip.sourceforge.net/en/plugins.html'
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip>=0.13' 'dirac>=0.9')
makedepends=('intltool>=0.35')
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/${pkgname}-${pkgver}.tar.gz"
"http://downloads.sourceforge.net/project/ogmrip/${pkgname}/${pkgver}/README"
)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/${pkgname}/README
}
md5sums=('0c46f74198f66c3c43b9ac653ba64a90'
         'f0e57c95c50814cf7594dc128ba074d6')
