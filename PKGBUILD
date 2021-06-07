# Maintainer: endo aya <endoaya@protonmail.ch>
pkgname=archer
pkgver=0.1
pkgrel=1
pkgdesc="fetch the archlinux news"
arch=('any')
license=('GPL')
makedepends=(rust git)
source=("$pkgname-$pkgver::git+https://github.com/echnobas/archer#commit=a9eb268571a4d5cbeec444b9a6c5cf5ac44f6805")

build() {
        cd $pkgname-$pkgver
        cargo build --release --locked --target-dir=target
}

package() {
        cd $pkgname-$pkgver
        install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

md5sums=('SKIP')
