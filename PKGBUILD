# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: Army
# Contributor: Dan Serban
# Contributor: insanum
# Contributor: Thomas Zervogiannis

pkgname=gcalcli-eoe-git
pkgver=3.4.0
pkgrel=2
pkgdesc='Google Calendar Command Line Interface with end of event time'
arch=('any')
url=https://github.com/nemanjan00/gcalcli
license=('MIT')
depends=('python2-google-api-python-client' 'python2-dateutil' 'python2-gflags' 'python2-oauth2client1412')
optdepends=('python2-vobject: for ics/vcal importing'
            'python2-parsedatetime: for fuzzy dates/times like "now", "today",
              "eod tomorrow", etc.')
source=("gcalcli-$pkgver::https://raw.githubusercontent.com/nemanjan00/gcalcli/17ce5c2125f24e46cf644df82d242629ffb237fc/gcalcli")
sha256sums=('8d862684940b6774be5bca6a28c0201d83eb433f2f7e197f6eeb04092c66c0e3')

prepare() {
  sed -i -e '1s/$/2/' -e 's/oauth2client/oauth2client1412/' gcalcli-$pkgver
}

package() {
  install -Dm755 gcalcli-$pkgver "$pkgdir"/usr/bin/gcalcli
}

# vim:set ts=2 sw=2 et:
