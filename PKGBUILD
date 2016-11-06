# Maintainer: Michał Sałaban <michal@salaban.info>

pkgname=python-diff_match_patch
pkgver=20121119
pkgrel=1
pkgdesc='The Diff Match and Patch libraries offer robust algorithms to perform the operations required for synchronizing plain text'
arch=('any')
url='http://code.google.com/p/google-diff-match-patch/'
license=('Apache')
depends=('python')
source=("https://pypi.python.org/packages/22/82/46eaeab04805b4fac17630b59f30c4f2c8860988bcefd730ff4f1992908b/diff-match-patch-$pkgver.tar.gz")
md5sums=('08e02cad82dda942b09ee248772fe143')

build() {
	cd "$srcdir/diff-match-patch-$pkgver"
	python setup.py test
}

package() {
	cd "$srcdir/diff-match-patch-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir/"
}
