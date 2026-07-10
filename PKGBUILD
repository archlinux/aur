# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=keyecho-bin
_pkgname=KeyEcho
pkgver=1.0.0
pkgrel=1
pkgdesc='Instantly hear pleasant sounds when typing, no matter what keyboard you use'
arch=('x86_64' 'aarch64')
url='https://github.com/ZacharyL2/KeyEcho'
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'alsa-lib')
provides=('keyecho')
conflicts=('keyecho')
source_x86_64=("$_pkgname-$pkgver-x86_64.rpm::$url/releases/download/v$pkgver/$_pkgname-$pkgver-1.x86_64.rpm")
source_aarch64=("$_pkgname-$pkgver-aarch64.rpm::$url/releases/download/v$pkgver/$_pkgname-$pkgver-1.aarch64.rpm")
sha256sums_x86_64=('f7fd6a6dd63c8194023dec3b471081367b68b81f389da5faca0b825bd6ac3f4a')
sha256sums_aarch64=('18ef74f36d7203165984d22aa6ec6b33172ef65be7c8a00143231010af5281fd')

package() {
    # rpm payload matches Arch layout: usr/bin, usr/share/{applications,icons}
    bsdtar -xf "$srcdir"/*.rpm -C "$pkgdir"
}
