# Maintainer: Selby Mashiki mashikiselby@gmail.com
pkgname=centium
pkgver=0.2.0
pkgrel=1
pkgdesc="A minimal, preview-first pacman UX wrapper with AUR support"
arch=('any')
url="https://github.com/Kolgrim33/centium"
license=('MIT')
keywords=('pacman' 'aur' 'arch' 'package-manager' 'cli')
depends=('python' 'python-rich' 'git' 'base-devel')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kolgrim33/$pkgname/archive/refs/heads/master.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-master"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-master"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
