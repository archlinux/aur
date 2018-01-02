# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

_pkgname='autodl-irssi'
pkgname="${_pkgname}-community"
pkgver=2.0.1
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
install="${pkgname}.install"
provides=("${_pkgname}")
replaces=("autodl-irssi-svn")
conflicts=("autodl-irssi-svn")
source=("https://github.com/autodl-community/${_pkgname}/archive/community-v${pkgver}.tar.gz")
md5sums=('6fbfb0d4e0ee01156b444c5fdeaf55ca')

package() {
  cd "$srcdir/${pkgname}-v${pkgver}"

	install -dm755 "$pkgdir/usr/share/$_pkgname"

  # copy over all the IRC/tracker files
  cp -r "AutodlIrssi" "$pkgdir/usr/share/$_pkgname/"
  chmod 755 "$pkgdir/usr/share/$_pkgname/AutodlIrssi"
	
  install -Dm644 "autodl-irssi.pl" "$pkgdir/usr/share/$_pkgname"
  install -Dm644 "README.md" "$pkgdir/usr/share/$_pkgname"
}

# vim:ts=2 sw=2 et:
