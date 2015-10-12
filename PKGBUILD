gitname=ohmu
pkgname=python2-${gitname}-git
pkgver=44.2a82937
pkgrel=1
pkgdesc="View space usage in your terminal. (git version)"
arch=('any')
url="https://github.com/paul-nechifor/ohmu"
license=("MIT")
makedepends=('git' 'python2-setuptools')
depends=()
provides=('python2-ohmu-git')
conflicts=('python2-ohmu')
source=("git+https://github.com/paul-nechifor/${gitname}.git")
md5sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${gitname}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

package() {
	 cd "${srcdir}/${gitname}"
	 python2 setup.py install --root="${pkgdir}" --optimize=1
}