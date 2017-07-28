# Maintainer: Ryan Farley <ryan.farleyl@gmx.com>
pkgname=moshy-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r8.df0b2bc
pkgrel=1
pkgdesc="A simple Mosh wrapper with profile settings"
arch=('any')
url="https://github.com/kiniou/moshy"
license=('GPL')
depends=('python-docopt')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/kiniou/moshy.git')
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
  	python setup.py install --root="$pkgdir/" --optimize=1	
}
