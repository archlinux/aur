# Maintainer: Adel Noureddine <adel.noureddine@outlook.com>
pkgname=powerjoular
pkgver=1.0.0
pkgrel=1
pkgdesc="PowerJoular allows monitoring power consumption of multiple platforms and processes."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/joular/powerjoular"
license=('GPL3')
depends=('gcc-ada' 'gprbuild' 'xmlada' 'libgpr')
source=("$pkgname-$pkgver.tar.gz::https://github.com/joular/powerjoular/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-develop"
    gprbuild -P powerjoular.gpr
}

package() {
    cd "$srcdir/$pkgname-develop"
    install -Dm755 obj/powerjoular "$pkgdir/usr/bin/powerjoular"
    install -Dm644 systemd/powerjoular.service "$pkgdir/etc/systemd/system/powerjoular.service"
}
