# $Id$
# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: Army
# Contributor: Dan Serban
# Contributor: insanum
# Contributor: Thomas Zervogiannis

pkgname=gcalcli
pkgver=3.2
pkgrel=2
pkgdesc="Google Calendar Command Line Interface"
arch=('any')
url="https://github.com/insanum/gcalcli"
license=('MIT')
depends=('python2-google-api-python-client' 'python2-dateutil' 'python2-gflags')
optdepends=('python2-vobject: For ics/vcal importing'
            'python2-parsedatetime: For fuzzy dates/times like "now", "today",
              "eod tomorrow", etc.')
source=("https://github.com/insanum/$pkgname/archive/v$pkgver.tar.gz"
        'LICENSE.gcalcli')
sha256sums=('9b3465be8e64c291ffe4582f8cb779a7025c700e6a83aae74722d87a3b88d55a'
            'cb38022bb68ccf91dfaef624df51a45204e67555b3cb6fd6918d952a6a211362')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e "1s/$/2/" "$pkgname"
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/LICENSE.gcalcli" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
