# Maintainer: Sebastian Weiß <dl3yc at darc dot de>
pkgname=python-mcp2210-python-git
pkgver=75e3c35
pkgrel=1
pkgdesc="An MCP2210 python driver."
arch=(x86_64)
url="https://jeremyherbert.github.io/mcp2210-python/"
license=('')
depends=('python' 'python-distribute' 'python-docutils' 'python-hidapi')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')

_gitroot='https://github.com/jeremyherbert/mcp2210-python.git'
_gitname='mcp2210-python'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
}

package() {
	cd "$srcdir/$_gitname"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
