# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="yarr-bin"
pkgver=2.5
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
sha256sums_x86_64=("19bde8ce82070f924b1f49101890b6e2c47d0d0d70a7153117e3180749b35ce6")
sha256sums_aarch64=("bca8b66ece38ce7023af0f425aa1c6a94db5082b8007519de1596c54edd82b70")
sha256sums_armv7h=("5dc5c823c19714648d9f669212dc6f5cff9faf980db6e5e0552826155270596d")

package () {
    install -Dm0755 yarr "$pkgdir/usr/bin/yarr"
    install -Dm0644 yarr.sysusers "$pkgdir/usr/lib/sysusers.d/yarr.conf"
    install -Dm0644 yarr.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/yarr.conf"
    install -Dm0644 yarr.service "$pkgdir/usr/lib/systemd/system/yarr.service"
    install -Dm0644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
