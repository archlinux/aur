# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: mdraw.gh at gmail dot com

pkgbase='python-colorlog'
pkgname=('python-colorlog' 'python2-colorlog')
pkgver='3.1.0'
pkgrel=3
pkgdesc="Log formatting with colors"
arch=('any')
url='https://github.com/borntyping/python-colorlog'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/borntyping/python-colorlog/archive/v$pkgver.tar.gz")
sha256sums=('e766265cf249947f1690d5d7f4fe566a2d48a86640f6777374671aa05f6214b8')

package_python-colorlog() {
	depends=('python')
	conflicts=('python-colorlog-git')

	cd "$srcdir/$pkgbase-$pkgver"
	python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/python-colorlog/LICENSE"
}

package_python2-colorlog() {
	depends=('python2')
	conflicts=('python2-colorlog-git')

	cd "$srcdir/$pkgbase-$pkgver"
	python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/python2-colorlog/LICENSE"
}
