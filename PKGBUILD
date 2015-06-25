# Maintainer: AcidHub <contact@acidhub.click>

pkgname=nullidentdmod
pkgver=1.1
pkgrel=2
pkgdesc="Minimal identd server with customizable userid"
conflicts=('oidentd' 'nullidentd' 'pindetd' 'nullidentdmod-git')
arch=('any')
url="http://acidhub.click/NullidentdMod/"
license=('GPL')
source=("https://github.com/Acidhub/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d7f6553df72b593aaf1fcbdb489bf4a2a6e93caeff56d0c0182316c14bd0049e')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


