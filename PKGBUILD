# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname=yarr-bin
pkgver=v2.3
pkgrel=1
pkgdesc="yet another rss reader"
arch=(x86_64)
url="https://github.com/nkanaev/yarr"
license=(MIT)
depends=(glibc)
source=(
    "$url/releases/download/v2.3/yarr-$pkgver-linux64.zip"
    "https://raw.githubusercontent.com/nkanaev/yarr/$pkgver/license"
    yarr.sysusers
    yarr.tmpfiles
    yarr.service
)
sha256sums=(
    "5bd4580b5d742b1415d1a007661bfa408ed03a0145948f87dbe1db4d6077c104"
    "d18d9679a81d1644b42e99348c7fea7079c58e5d56def876442ebd3936ea490c"
    "2e006a20783c86e5fd94c11278793e98de9c3d1e97ebfb289130a21947827129"
    "9af883d6a5859f0779652c651018f54575cced70a655e3665e83b409b657c626"
    "c182429525da2f9229082f2b5d7c4be60ac0d4804021a0e1b040b31b6ee12bbe"
)

package () {
    install -Dm0755 yarr "$pkgdir/usr/bin/yarr"
    install -Dm0644 yarr.sysusers "$pkgdir/usr/lib/sysusers.d/yarr.conf"
    install -Dm0644 yarr.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/yarr.conf"
    install -Dm0644 yarr.service "$pkgdir/usr/lib/systemd/system/yarr.service"
    install -Dm0644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
