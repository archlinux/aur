# Maintainer: yubimusubi
pkgname=('3dsconv-git')
provides=('3dsconv')
conflicts=('3dsconv')
pkgver=r71.8a82606
pkgrel=1
pkgdesc='Tool to convert Nintendo 3DS CTR Cart Image files (CCI, ".3ds") to the CTR Importable Archive format (CIA).'
arch=('any')
url="https://github.com/ihaveamac/3dsconv"
license=('MIT')
depends=('python2')
makedepends=('git' 'tar')
options=('!strip')

source=(
    "$pkgname::git+https://github.com/ihaveamac/3dsconv.git"
)

sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -d "$pkgdir/usr/bin/"
    install "3dsconv.py" "$pkgdir/usr/bin/3dsconv"
}
