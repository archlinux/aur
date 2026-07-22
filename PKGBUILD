pkgname=hydrafetch
pkgver=53af8e9
pkgrel=1
pkgdesc="A simple system information fetch tool written in Python"
arch=('any')
url="https://github.com/lfotkrc/hydrafetch"
license=('MIT')
depends=('python' 'python-psutil' 'python-colorama')
source=("git+https://github.com/lfotkrc/hydrafetch.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --always 2>/dev/null || echo "$pkgver"
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 hydrafetch "$pkgdir/usr/bin/hydrafetch"
}
