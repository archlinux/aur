# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: Army
# Contributor: Dan Serban
# Contributor: insanum
# Contributor: Thomas Zervogiannis

pkgname=gcalcli
pkgver=3.3.2
pkgrel=2
pkgdesc='Google Calendar Command Line Interface'
arch=('any')
url=https://github.com/insanum/gcalcli
license=('MIT')
depends=('python2-google-api-python-client' 'python2-dateutil' 'python2-gflags' 'python2-oauth2client')
optdepends=('python2-vobject: for ics/vcal importing'
            'python2-parsedatetime: for fuzzy dates/times like "now", "today",
              "eod tomorrow", etc.')
source=("gcalcli-$pkgver::https://raw.githubusercontent.com/insanum/gcalcli/v$pkgver/gcalcli")
sha256sums=('b3b1946136e140fed457778802329af7ce936da052688365e23ecb4b37e5dbe8')

prepare() {
  sed -i -e '1s/$/2/' -e 's/import run/import run_flow as run/' gcalcli-$pkgver
}

package() {
  install -Dm755 gcalcli-$pkgver "$pkgdir"/usr/bin/gcalcli
}

# vim:set ts=2 sw=2 et:
