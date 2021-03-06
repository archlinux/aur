# Maintainer: Kobus van Schoor <v dot schoor dot kobus at gmail dot com>
pkgname=dotgit
pkgver='2.2.9'
pkgrel=0
pkgdesc='A comprehensive solution to managing your dotfiles'
url='https://github.com/kobus-v-schoor/dotgit'
arch=('any')
depends=('git' 'python')
optdepends=('gnupg: encryption support')
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
	install -Dm644 pkg/completion/bash.sh -T \
		"$pkgdir/usr/share/bash-completion/completions/dotgit"
}
