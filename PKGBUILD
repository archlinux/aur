# Maintainer: Aleksei Lissitsin <aleksei.lissitsin 'at' gmail 'dot' com>

_pkgname=sharelatex-git-integration-unofficial
pkgname=${_pkgname}-git
pkgver=36
pkgrel=1
pkgdesc="Easily track your ShareLaTeX changes using git. One simple command to rule them all!"
arch=('any')
url="https://github.com/Jorl17/sharelatex-git-integration-unofficial"
license=('GPL')
depends=('python-requests' 'python-beautifulsoup4')
makedepends=('git' 'python-distribute')
source=("git+https://github.com/Jorl17/sharelatex-git-integration-unofficial.git")
md5sums=('SKIP')

pkgver() {
	cd ${_pkgname}
    git rev-list --count HEAD
}

package() {
	cd "$_pkgname"
	python setup.py install --root=${pkgdir}
}