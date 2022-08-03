# Maintainer: Francisco Giordano <fg@frang.io>

pkgname=comby-bin
pkgver=1.8.1
pkgrel=3
pkgdesc="A code rewrite tool for structural search and replace that supports ~every language."
provides=('comby')
conflicts=('comby')
arch=('x86_64')
url="https://comby.dev/"
license=('Apache')
depends=('sqlite' 'zlib' 'libev' 'glibc' 'pcre')
makedepends=('patchelf')
source=("comby-$pkgver.tar.gz::https://github.com/comby-tools/comby/releases/download/$pkgver/comby-$pkgver-x86_64-linux.tar.gz")
sha256sums=('ec0ca6477822154d71033e0b0a724c23a0608b99028ecab492bc9876ae8c458a')

package() {
        comby="comby-$pkgver-x86_64-linux"
        patchelf --replace-needed libpcre.so.3 libpcre.so "$comby"
        install -Dm755 "$comby" "$pkgdir/usr/bin/comby"
}

# vim: et sw=8 ft=PKGBUILD
