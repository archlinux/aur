# Maintainer: André Kugland <kugland@gmail.com>

_pkgname=neocities-deploy
pkgname=$_pkgname-bin
pkgdesc='Command-line tool for deploying your Neocities site (prebuilt statically-linked binary)'
url="https://github.com/kugland/$_pkgname"
pkgver=0.1.25
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('GPL-3.0-or-later')
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz") # For README.md
source_x86_64=("$_pkgname-$pkgver-bin-x86_64.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-x86_64-musl.tar.gz")
source_i686=("$_pkgname-$pkgver-bin-i686.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-i686-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-bin-aarch64.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-aarch64-musl.tar.gz")
source_armv7h=("$_pkgname-$pkgver-bin-arm.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-arm-musl.tar.gz")
sha256sums=('d46c33675b8b8ff3e94c93c5bb7514fdfd0ba4a10f533da02c5b5fc89b21d46f')
sha256sums_x86_64=('a3502337341dc64d1999d955c9a896532b0c4a2f3a8c1e2c9361266823fc5ba1')
sha256sums_i686=('019aaf61bd863c82a556829359bec2f9a51abcd3e2b7c83fdd88b7fb643f7214')
sha256sums_aarch64=('bbba32ce0d13497e6d846dea780453319824841f7ba2da4c946e75fff5f48828')
sha256sums_armv7h=('bdcb02b7ae5a061ec953a1b72f67cda0976be6484d75d4f4c95771e8cf492117')

package() {
    cd "$srcdir"
    install -Dm0755 -t "$pkgdir/usr/bin/" neocities-deploy
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm0644 -t "$pkgdir/usr/doc/$_pkgname/" README.md
}
