# Maintainer: André Kugland <kugland@gmail.com>

_pkgname=neocities-deploy
pkgname=$_pkgname-bin
pkgdesc='Command-line tool for deploying your Neocities site (prebuilt statically-linked binary)'
url="https://github.com/kugland/$_pkgname"
pkgver=0.1.20
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('GPL-3.0-or-later')
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz") # For README.md
source_x86_64=("$_pkgname-$pkgver-bin-x86_64.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-x86_64-musl.tar.gz")
source_i686=("$_pkgname-$pkgver-bin-i686.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-i686-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-bin-aarch64.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-aarch64-musl.tar.gz")
source_armv7h=("$_pkgname-$pkgver-bin-arm.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-arm-musl.tar.gz")
sha256sums=('be77e0360394f6b24e9b6c81a1f9a704e8ef474e76c9a3e26da761a75a77d283')
sha256sums_x86_64=('3257fb35b53278684cda45edd318482fc54c09bf9b38b5c625b25a795e127423')
sha256sums_i686=('e9936ecb871668be3200c807d5c602a7f2c6dba0b81656af2bcecb9e21b4527d')
sha256sums_aarch64=('07a0b5105a4bec4a3f7925943b6e542d46373f54a27a53625c5c1b1c2e3fa3e9')
sha256sums_armv7h=('eedab14ab2d5116c8ce70e01dc41b49acd8261b1f595b70365efbcb59ad84ec9')

package() {
    cd "$srcdir"
    install -Dm0755 -t "$pkgdir/usr/bin/" neocities-deploy
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm0644 -t "$pkgdir/usr/doc/$_pkgname/" README.md
}
