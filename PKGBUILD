# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
# Contributor: Guten Ye

pkgname='rutorrent-autodl-irssi-community'
_pkgname='autodl-rutorrent-community'
pkgver=1.62
pkgrel=1
pkgdesc='Community fork of the autodl-irssi rutorrent plugin.'
arch=('any')
url='http://sourceforge.net/projects/autodl-irssi'
license=('MPL')
install='rutorrent-autodl-irssi-community.install'
depends=('rutorrent' "autodl-irssi-community=${pkgver}")
provides=('rutorrent-autodl-irssi')
replaces=('rutorrent-autodl-irssi-svn')
source=("https://github.com/autodl-community/autodl-rutorrent/archive/community-v${pkgver}.tar.gz")
md5sums=('e5880da80fdda8e75c5b97a140c5a6d1')

build() {
  cd "$srcdir/$_pkgname-v$pkgver"
  mv _conf.php conf.php
}

package() {
  cd "$srcdir/$_pkgname-v$pkgver"

  install -dm755 "$pkgdir/usr/share/webapps/rutorrent/plugins/autodl-irssi"
  cp -r * "$pkgdir/usr/share/webapps/rutorrent/plugins/autodl-irssi"
}

# vim:set ts=2 sw=2 et:
