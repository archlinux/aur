# Maintainer: AcidHub <contact@acidhub.click>

pkgname=nullidentdmod
pkgver=1.3
pkgrel=1
pkgdesc="Minimal identd server with customizable userid"
conflicts=('oidentd' 'nullidentd' 'pindetd' 'nullidentdmod-git')
arch=('any')
url="http://acidhub.click/NullidentdMod/"
license=('GPL')
source=("https://github.com/Acidhub/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('262d5e27f8a4bc7186b603681ffd8c0e257c810e9777d5ace7cae3b4c8b82aee')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


