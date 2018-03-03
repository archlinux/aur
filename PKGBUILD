# Maintainer: JP Cimalando <jp-dev@inbox.ru>
pkgname=hy
pkgver=0.14.0
pkgrel=1
pkgdesc="Python <--> Lisp layer"
arch=('any')
url="http://hylang.org/"
license=('MIT')
depends=('python-rply' 'python-astor' 'python-clint' 'python-args' 'python-setuptools')
conflicts=('hy-git')
options=(!emptydirs)
source=("git+https://github.com/hylang/hy.git")
md5sums=('SKIP')

prepare() {
    cd "$pkgname"
    git checkout "$pkgver"
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -rf "$pkgdir/usr/get_version"
}
