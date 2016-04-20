# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=securefs
pkgver=0.3.1
pkgrel=1
pkgdesc="A better transparent encryption filesystem"
arch=('i686' 'x86_64')
url="https://github.com/netheril96/securefs"
license=('MIT')
depends=('fuse' 'gcc-libs-multilib')
makedepends=('git')
source=('git+https://github.com/netheril96/securefs.git')
sha1sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" securefs
    strip -s securefs
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 securefs "$pkgdir"/usr/bin/securefs
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 docs/changelog.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG
}
