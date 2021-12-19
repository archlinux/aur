# Maintainer: Silas Groh <rubixdev@mailfence.com>

_pkgname=eztex
pkgname=$_pkgname-git
pkgver=r26.dcb11ac
pkgrel=1
pkgdesc="A CLI tool for quickly starting new LaTeX projects"
arch=('any')
url="https://github.com/RubixDev/$_pkgname"
license=('GPL3')
source=("$_pkgname::git+$url.git")
makedepends=('git')
provides=('eztex')
conflicts=('eztex')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "$srcdir/$_pkgname/eztex.sh" "$pkgdir/usr/bin/eztex"
    mkdir -p "$pkgdir/usr/share/$_pkgname"
    cp -r "$srcdir/$_pkgname/templates" "$pkgdir/usr/share/$_pkgname/"
    install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
