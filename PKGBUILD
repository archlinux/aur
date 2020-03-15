# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

_pkgname='autodl-irssi'
pkgname="${_pkgname}-community"
pkgver=2.6.2
pkgrel=1
pkgdesc='Community fork plugin for irssi to monitor IRC channels and filter for torrents.'
arch=('any')
url='https://github.com/autodl-community/autodl-irssi'
license=('MPL')
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
source=("https://github.com/autodl-community/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('42ca26db1de04f59aa91869033e441ef')

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  install -dm755 "$pkgdir/usr/share/$_pkgname"

  # copy over all the IRC/tracker files
  cp -r "AutodlIrssi" "$pkgdir/usr/share/$_pkgname/"
  chmod 755 "$pkgdir/usr/share/$_pkgname/AutodlIrssi"

  install -Dm644 "autodl-irssi.pl" "$pkgdir/usr/share/$_pkgname"
  install -Dm644 "README.md" "$pkgdir/usr/share/$_pkgname"
}

# vim:ts=2 sw=2 et:
