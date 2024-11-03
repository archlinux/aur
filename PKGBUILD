# Maintainer: Jasur Sadikov <jasur@sadikoff.com>
pkgname=mud-git
pkgver=1.0.3
pkgrel=1
pkgdesc="Multi repository git utility. Manage multiple git-repositories simultaneously."
arch=('any')
url="https://github.com/jasursadikov/mud"
license=('MIT')
depends=('python' 'python-prettytable')
makedepends=('python-build' 'python-setuptools' 'python-setuptools-scm' 'git')
source=("${pkgname}::git+https://github.com/jasursadikov/mud.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
