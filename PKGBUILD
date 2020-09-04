# Maintainer: Kobus van Schoor <v dot schoor dot kobus at gmail dot com>
pkgname=dotgit-git
pkgver='2.0.0a13'
pkgrel=0
pkgdesc='A comprehensive solution to managing your dotfiles'
url='https://github.com/kobus-v-schoor/dotgit'
arch=('any')
depends=('git' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/d/dotgit/dotgit-$pkgver.tar.gz")
md5sums=('SKIP')

build()
{
	cd "dotgit-$pkgver"
	python setup.py build
}

package()
{
	cd "dotgit-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 completion/bash.sh -t \
		"$pkgdir/usr/share/bash-completion/completions/dotgit"
}
