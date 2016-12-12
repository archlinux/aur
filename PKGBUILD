# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: Army
# Contributor: Dan Serban
# Contributor: insanum
# Contributor: Thomas Zervogiannis

pkgname=gcalcli
pkgver=3.4.0
pkgrel=1
pkgdesc='Google Calendar Command Line Interface'
arch=('any')
url=https://github.com/insanum/gcalcli
license=('MIT')
depends=('python2-google-api-python-client' 'python2-dateutil' 'python2-gflags' 'python2-oauth2client1412')
optdepends=('python2-vobject: for ics/vcal importing'
            'python2-parsedatetime: for fuzzy dates/times like "now", "today",
              "eod tomorrow", etc.')
source=("gcalcli-$pkgver::https://raw.githubusercontent.com/insanum/gcalcli/v$pkgver/gcalcli")
sha256sums=('9e833ae676bca4944cd9c34354f0d263ee196749fe888b235ca7aa3f200a2d59')

prepare() {
  sed -i -e '1s/$/2/' -e 's/oauth2client/oauth2client1412/' gcalcli-$pkgver
}

package() {
  install -Dm755 gcalcli-$pkgver "$pkgdir"/usr/bin/gcalcli
}

# vim:set ts=2 sw=2 et:
