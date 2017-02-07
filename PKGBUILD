# Maintainer: Moritz Schoenherr <moritz.schoenherr[at]gmail[dot]com>
pkgname=notmuch-addrlookup-c
pkgver=v8
pkgrel=1
pkgdesc="A tool to query the notmuch database for addresses."
url="https://github.com/aperezdc/notmuch-addrlookup-c"
arch=('any')
license=('MIT')
depends=('notmuch')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://github.com/aperezdc/notmuch-addrlookup-c/archive/${pkgver}.tar.gz"
        "MIT-LICENSE")

md5sums=('700906bdb8396cf0eb7a3b9d2c257d7d'
         'f9be2430c190c736214e76ead254ed07')

build() {

  cd "${srcdir}/${pkgname}-${pkgver:1:1}"

  make
}

package() {

  install -Dm644 "${srcdir}/MIT-LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/MIT-LICENSE"

  cd "${srcdir}/${pkgname}-${pkgver:1:1}"

  install -D notmuch-addrlookup $pkgdir/usr/bin/notmuch-addrlookup
}

