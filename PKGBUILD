# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
# Contributor: Guten Ye

_pkgname='autodl-rutorrent'
_installdir='usr/share/webapps/rutorrent/plugins/autodl-irssi'
pkgname='rutorrent-autodl-irssi-community'
pkgver=2.3.0
pkgrel=1
pkgdesc='Community fork of the autodl-irssi rutorrent plugin.'
arch=('any')
url='https://github.com/autodl-community/autodl-rutorrent'
license=('MPL')
install='rutorrent-autodl-irssi-community.install'
depends=('rutorrent' 'autodl-irssi-community>=2.0.0')
provides=('rutorrent-autodl-irssi')
replaces=('rutorrent-autodl-irssi-svn')
conflicts=('rutorrent-autodl-irssi-svn')
backup=("${_installdir}/conf.php")
source=("https://github.com/autodl-community/autodl-rutorrent/archive/v${pkgver}.tar.gz")
md5sums=('18e7c829520ad005993b59715e19fb32')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  mv _conf.php conf.php
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -dm755 "$pkgdir/$_installdir"
  cp -r * "$pkgdir/$_installdir"
}

# vim:set ts=2 sw=2 et:
