# Maintainer: Omar Semgey <omar.semgey@gmail.com>
pkgname=forgefoundary
pkgver=1.0.0
pkgrel=1
pkgdesc="Flexible, framework-agnostic scaffolding tool"
arch=('any')
url="https://github.com/omarSemgey/ForgeFoundary"
license=('MIT')
depends=('php>=8.2' 'composer' 'git')
source=("https://github.com/omarSemgey/ForgeFoundary/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed') 

package() {
    mkdir -p "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/ForgeFoundary-$pkgver"/* "$pkgdir/opt/$pkgname/"
    chmod +x "$pkgdir/opt/$pkgname/ForgeFoundary"
    install -Dm755 "$pkgdir/opt/$pkgname/ForgeFoundary" "$pkgdir/usr/bin/ForgeFoundary"
    install -Dm644 "$srcdir/ForgeFoundary-$pkgver/README.MD" "$pkgdir/usr/share/doc/$pkgname/README.MD"
}