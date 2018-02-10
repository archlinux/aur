# Maintainer: aimileus <me at aimileus dot nl>
pkgname=python-snowboy-git
_pkgname=snowboy
pkgver=v1.2.0.r128.g4ee4811
pkgrel=1
pkgdesc="A hotword detection engine - Python bindings"
arch=('x86_64')
url="https://snowboy.kitt.ai/"
license=('Apache')
depends=(
  'python'
  'atlas-lapack'
)
makedepends=(
  'git'
  'python-setuptools'
  'swig'
)
conflicts=('python-snowboy')
provides=('python-snowboy')
source=("git+https://github.com/Kitt-AI/snowboy.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	python setup.py build
}


package() {
	cd "$_pkgname"
	python setup.py install --root="$pkgdir/" --prefix=/usr
}
