# Maintainer: Vibhav Pant <vibhavp at gmail dot com>
pkgname=kernel-install-ukify
pkgver=v1.1.0
pkgrel=1
pkgdesc="kernel-install plugin to generate unified kernel images (UKIs) from initrds"
url="https://github.com/vibhavp/kernel-install-ukify"
arch=(any)
license=('MIT')
depends=('systemd')
makedepends=('git')
source=("git+https://github.com/vibhavp/kernel-install-ukify.git#tag=$pkgver?signed")
optdepends=('pacman-hook-kernel-install')
validpgpkeys=('7ED1D48C513CA024BE3A785FE3FB28CB6AB59598')
sha256sums=('SKIP')
optdepends=('pacman-hook-kernel-install: for pacman hook')

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
