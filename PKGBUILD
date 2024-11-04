# Maintainer: Alex Grabowski <hurufu+aur@gmail.com>
pkgbase=dogelog
pkgname=(dogelog-node dogelog-py dogelog-java)
pkgver=1.2.4
pkgrel=1
arch=(any)
url='https://www.dogelog.ch/'
pkgdesc='The avant-garde of logic programming'
license=(custom)
options=(!strip)
source=(https://www.dogelog.ch/typtab/rscsrv/docs/50_archive/archive_1_2/dogelog_1_2_4.zip)
sha256sums=('9521b48acdae738fe41b3de93d5fbe9f8996cf34d9537f146241f90a4dd4de75')

package_any() {
    install -D --mode=644 -t "$pkgdir/usr/share/licenses/$pkgbase/$1" ../LICENSE
    install -D --mode=655 -t "$pkgdir/usr/share/$pkgbase" "$2"
}

package_dogelog-py() {
    pkgdesc='The avant-garde of logic programming (Python backend)'
    depends=(python3)
    package_any py playerpy/canned/dogelog.py
}

package_dogelog-node() {
    pkgdesc='The avant-garde of logic programming (NodeJS backend)'
    depends=(nodejs)
    package_any node player/canned/dogelog.mjs
}

package_dogelog-java() {
    pkgdesc='The avant-garde of logic programming (Java backend)'
    depends=(java-runtime)
    package_any java playerj/canned/dogelog.zip
}
