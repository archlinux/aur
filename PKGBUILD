# Contributor: Piotr Rogoża <rogoza.piotr@gmail.com>
# Created: 20/09/2010
pkgname=ogmrip-shrip
_pkgname=shrip
pkgver=0.6.0
pkgrel=2
pkgdesc='shrip is an application for ripping and encoding DVD into AVI/OGM files'
arch=('i686' 'x86_64')
url='http://ogmrip.sourceforge.net/en/plugins.html'
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip>=0.13.0' 'glib2>=2.6.0')
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/${_pkgname}-${pkgver}.tar.gz"
"http://downloads.sourceforge.net/project/ogmrip/${_pkgname}/${pkgver}/README")
build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/ogmrip-shrip/README
}

# vim:set ts=2 sw=2 et ft=sh:

md5sums=('fe5da49fb5857b68662be3b1e2406c46'
         'f65c2a2db7f22bc663749c138b3b6baa')
