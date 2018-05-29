# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: mdraw.gh at gmail dot com

pkgbase='python-colorlog'
pkgname=('python-colorlog' 'python2-colorlog')
pkgver=3.1.4
pkgrel=1
pkgdesc="Log formatting with colors"
arch=('any')
url='https://github.com/borntyping/python-colorlog'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/borntyping/python-colorlog/archive/v$pkgver.tar.gz")
sha256sums=('14a0eb39242354340955560d92d021b260580d3986ecbb489995e944b248c840')

package_python-colorlog() {
    depends=('python')
    conflicts=('python-colorlog-git')

    cd "$srcdir/$pkgbase-$pkgver"
    python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-colorlog() {
    depends=('python2')
    conflicts=('python2-colorlog-git')

    cd "$srcdir/$pkgbase-$pkgver"
    python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
