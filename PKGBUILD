# Maintainer: Alex Grabowski <hurufu+aur@gmail.com>
pkgbase=dogelog
pkgname=(dogelog-node dogelog-py dogelog-java)
pkgver=1.2.4
pkgrel=1
pkgdesc='The avant-garde of logic programming'
arch=(any)
url='https://www.dogelog.ch/'
license=(custom)
makedepends=(npm)
options=(!strip)
source=("$pkgbase::git+https://www.dogelog.ch/dogelog/.git")
sha256sums=(SKIP)

package_any() {
    install -D --mode=644 -t "$pkgdir/usr/share/licenses/$pkgbase/$1" ../LICENSE
    install -D --mode=655 -t "$pkgdir/usr/share/$pkgbase" "$pkgbase/$2"
}

package_dogelog-py() {
    depends=(python)
    package_any py playerpy/canned/dogelog.py
}

package_dogelog-node() {
    depends=(nodejs)
    package_any node player/canned/dogelog.mjs
}

package_dogelog-java() {
    depends=(java-runtime)
    package_any java playerj/canned/dogelog.zip
}
