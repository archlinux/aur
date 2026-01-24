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
sha256sums=('4482d5ce5f5b7a346b1fd4f88e5bed00ef1286d53e8843a0ff66d05577cc6f08') 

package() {
    mkdir -p "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/ForgeFoundary-$pkgver/"* "$pkgdir/opt/$pkgname/"
    cd "$pkgdir/opt/$pkgname"
    export COMPOSER_ALLOW_SUPERUSER=1
    composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist
    install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.MD"
}
