# Maintainer: hitori <hitori.gm at gmail dot com>
pkgname=decrypt-git
pkgver=r28.4f11040
pkgrel=2
pkgdesc="Pipe programs through decrypt to make your boss think you are l33t"
arch=('any')
url="https://github.com/jtwaleson/decrypt"
license=('MIT')
makedepends=('git' 'python-setuptools')
source=('decrypt-git::git://github.com/jtwaleson/decrypt')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
