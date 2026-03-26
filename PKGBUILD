# Maintainer: disposable <noreply@noreply>
pkgname=placeholder-pkg-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Disposable test package"
arch=('any')
url="https://github.com/noctuum/placeholder-pkg"
license=('MIT')
source=("git+https://github.com/noctuum/placeholder-pkg.git")
sha256sums=('SKIP')

pkgver() {
    cd placeholder-pkg
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 "$srcdir/placeholder-pkg/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
