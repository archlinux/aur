# Maintainer: Piotr Rogoża <rogoza.piotr@gmail.com>
# Contributor: Piotr Rogoża <rogoza.piotr@gmail.com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=ogmrip-nero-aac
pkgver=0.5
pkgrel=1
pkgdesc='Plugin which adds support for Nero-AAC audio codec for ogmrip'
arch=('i686' 'x86_64')
url='http://ogmrip.sourceforge.net/en/plugins.html'
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip>=0.13' 'mplayer>=0.92' 'neroaacenc')
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/${pkgname}-${pkgver}.tar.gz"
"http://downloads.sourceforge.net/project/ogmrip/${pkgname}/${pkgver}/README")
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/ogmrip-nero-aac/README
}
md5sums=('209c2e4c77e2593e9092f7326f0fab75'
         'fd19295854fea0d9f7a3ab6666f6f262')
