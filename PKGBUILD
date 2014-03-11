# Maintainer: Caleb Maclennan <caleb@alerque.com>
pkgname=freecheck
pkgver=0.30
pkgrel=4
url=https://github.com/alerque/$pkgname
pkgdesc='A blank check printer that adds MICR codes and check templates to blank stock.'
arch=('any')
license=('GPL2')
depends=('perl' 'gnumicr')
conflicts=("$_pkgname")
optdepends=('cups: printing support' 'ghostscript: output to pdf files')
source=("${pkgname}-${pkgver}::https://github.com/alerque/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('6c7f7707962329a61bc56ce739178a61')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 freecheck.cfg "$pkgdir/etc/freecheck/freecheck.cfg"
    install -Dm755 freecheck "$pkgdir/usr/bin/freecheck"
}

