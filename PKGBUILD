# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="yarr-bin"
pkgver=2.6
_pkgver=v$pkgver
pkgrel=1
pkgdesc="yet another rss reader"
arch=(x86_64 aarch64 armv6h armv7h)
url="https://github.com/nkanaev/yarr"
license=(MIT)
depends=(glibc)
source=(
    "https://raw.githubusercontent.com/nkanaev/yarr/$_pkgver/license"
    yarr.sysusers
    yarr.tmpfiles
    yarr.service
)
_dl="$url/releases/download/v$pkgver"
source_x86_64=("yarr-$pkgver-x86_64.zip::$_dl/yarr_linux_amd64.zip")
source_aarch64=("yarr-$pkgver-aarch64.gz::$_dl/yarr_linux_arm64.zip")
source_armv7h=("yarr-$pkgver-armv7h.gz::$_dl/yarr_linux_armv7.zip")

sha256sums=(
    "d18d9679a81d1644b42e99348c7fea7079c58e5d56def876442ebd3936ea490c"
    "2e006a20783c86e5fd94c11278793e98de9c3d1e97ebfb289130a21947827129"
    "9af883d6a5859f0779652c651018f54575cced70a655e3665e83b409b657c626"
    "c182429525da2f9229082f2b5d7c4be60ac0d4804021a0e1b040b31b6ee12bbe"
)
sha256sums_x86_64=("842d124099c68d47804e623c40129dc9b4d2b46514a13d91a393a02c49e01f95")
sha256sums_aarch64=("b2a71ee47e65153c6d611f6d36137daf786852e6715c008387889551677b4043")
sha256sums_armv7h=("2841c305a02400b59d77c72879f405527b11e7b565c755acbfab007c3fa97815")

package () {
    install -Dm0755 yarr "$pkgdir/usr/bin/yarr"
    install -Dm0644 yarr.sysusers "$pkgdir/usr/lib/sysusers.d/yarr.conf"
    install -Dm0644 yarr.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/yarr.conf"
    install -Dm0644 yarr.service "$pkgdir/usr/lib/systemd/system/yarr.service"
    install -Dm0644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
