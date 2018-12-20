# Maintainer: j605
# Contributor: Moritz Schoenherr <moritz.schoenherr[at]gmail[dot]com>
pkgname=notmuch-addrlookup-c
pkgver=v9
pkgrel=1
pkgdesc="A tool to query the notmuch database for addresses."
url="https://github.com/aperezdc/notmuch-addrlookup-c"
arch=('x86_64')
license=('MIT')
depends=('notmuch')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aperezdc/notmuch-addrlookup-c/archive/${pkgver}.tar.gz"
        "MIT-LICENSE")
md5sums=('c4a659213225730d2512934e4aca3254'
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

