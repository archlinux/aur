# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: Army
# Contributor: Dan Serban
# Contributor: insanum
# Contributor: Thomas Zervogiannis

pkgname=gcalcli
pkgver=3.2
pkgrel=6
pkgdesc='Google Calendar Command Line Interface'
arch=('any')
url=https://github.com/insanum/gcalcli
license=('MIT')
depends=('python2-google-api-python-client' 'python2-dateutil' 'python2-gflags')
optdepends=('python2-vobject: for ics/vcal importing'
            'python2-parsedatetime: for fuzzy dates/times like "now", "today",
              "eod tomorrow", etc.')
source=("gcalcli-$pkgver::https://raw.githubusercontent.com/insanum/gcalcli/v$pkgver/gcalcli")
sha256sums=('23dc5f924095ec593b5a50b6373e07bde71bfce0d64a750e6ad4d5701f238dcf')

prepare() {
  sed -i -e "1s/$/2/" gcalcli-$pkgver
}

package() {
  install -Dm755 gcalcli-$pkgver "$pkgdir"/usr/bin/gcalcli
}

# vim:set ts=2 sw=2 et:
