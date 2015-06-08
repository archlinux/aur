# Maintainer: Ruthger Gubbels <ruthger@ruthger.nl>
# Contributor: Damian Nowak <spam@nowaker.net>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: Travis Lyons <travis.lyons@gmail.com>

pkgname='archipel-client-nightly'
pkgver=20150609
pkgrel=1
pkgdesc='A solution to manage and supervise virtual machines. (GUI)'
arch=('any')
url='http://archipelproject.org/'
license=('AGPL')
makedepends=('wget')
provides=('archipel-client')
conflicts=('archipel-client')
source=('http://nightlies.archipelproject.org/latest-archipel-client.tar.gz')
sha512sums=('SKIP')
options=(!strip !emptydirs)

pkgver() {
  date +%Y%m%d  
}

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/archipel"
  cp -r 'Archipel'/* "$pkgdir/usr/share/archipel"
  find "$pkgdir/usr/share/archipel" -type f -exec chmod 644 {} \;
  find "$pkgdir/usr/share/archipel" -type d -exec chmod 755 {} \;
}
