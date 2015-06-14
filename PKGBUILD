# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=ogmrip-flac
pkgver=0.2
pkgrel=1
pkgdesc='Plugin which adds support for the FLAC audio codec for ogmrip'
arch=('i686' 'x86_64')
url='http://ogmrip.sourceforge.net/en/plugins.html'
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip>=0.13' 'mplayer>=0.92' 'flac')
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/${pkgname}-${pkgver}.tar.gz"
"http://downloads.sourceforge.net/project/ogmrip/${pkgname}/${pkgver}/README"
)
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/ogmrip-flac/README
}
md5sums=('98f769b1a24bd69e563bb0408f161ea4'
         'e638a00b8ffe49071ccf496fa4143f28')
