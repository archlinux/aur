# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

pkgname='autodl-irssi-community'
_pkgname='autodl-irssi'
pkgver=1.62
pkgrel=1
pkgdesc='Community fork of the plugin for irssi which monitors IRC announce channels and downloads torrents based on user defined filters.'
arch=('any')
url='https://github.com/autodl-community/autodl-irssi'
license=('MPL')
changelog='CHANGELOG.md'
depends=('irssi'
         'perl-archive-zip'
         'perl-net-ssleay'
         'perl-html-parser'
         'perl-xml-libxml'
         'perl-digest-sha1'
         'perl-json'
         'perl-json-xs'
         'perl-xml-libxslt')
makedepends=('git')
install="${pkgname}.install"
optdepends=('rutorrent-autodl-irssi-community: Community autodl-irssi plugin for rutorrent.')
provides=("${_pkgname}")
replaces=("${_pkgname}")
source=("https://github.com/autodl-community/autodl-irssi/releases/download/community-v${pkgver}/${pkgname}-v${pkgver}.zip")
md5sums=('1fd5701578f69a293547fea7f697c6e1')

package() {
  cd "$srcdir/"

	install -dm755 "$pkgdir/usr/share/$_pkgname"

  # copy over all the IRC/tracker files
  cp -r "AutodlIrssi" "$pkgdir/usr/share/$_pkgname/"A
  chmod 755 "$pkgdir/usr/share/$_pkgname/AutodlIrssi"
  chmod 755 "$pkgdir/usr/share/$_pkgname/AutodlIrssi/trackers"
	
  install -Dm644 "autodl-irssi.pl" "$pkgdir/usr/share/$_pkgname"
  install -Dm644 "README.md" "$pkgdir/usr/share/$_pkgname"
}

# vim:ts=2 sw=2 
