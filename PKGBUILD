# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: Army
# Contributor: Dan Serban
# Contributor: insanum
# Contributor: Thomas Zervogiannis

pkgname=gcalcli
pkgver=3.3
pkgrel=1
pkgdesc='Google Calendar Command Line Interface'
arch=('any')
url=https://github.com/insanum/gcalcli
license=('MIT')
depends=('python2-google-api-python-client' 'python2-dateutil' 'python2-gflags')
optdepends=('python2-vobject: for ics/vcal importing'
            'python2-parsedatetime: for fuzzy dates/times like "now", "today",
              "eod tomorrow", etc.')
source=("gcalcli-$pkgver::https://raw.githubusercontent.com/insanum/gcalcli/v$pkgver/gcalcli")
sha256sums=('8f5e0ad429209b029507793eb3cea60a827b1e70003f44a0d4a9b4f5154d5da5')

prepare() {
  sed -i -e "1s/$/2/" gcalcli-$pkgver
}

package() {
  install -Dm755 gcalcli-$pkgver "$pkgdir"/usr/bin/gcalcli
}

# vim:set ts=2 sw=2 et:
