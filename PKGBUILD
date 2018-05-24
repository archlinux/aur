# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>

_name='bullet3'
pkgname="python-pybullet-git"
pkgver=r6464.abeae7e1e
pkgrel=1
pkgdesc='Python Interface for the Bullet Physics SDK specialized for Robotics Simulation and Reinforcement Learning'
provides=('python-pybullet')
url="https://github.com/bulletphysics/${_name}"
depends=('python-numpy')
makedepends=('cmake' 'python-setuptools')
optdepends=()
license=('MIT')
arch=('x86_64')

pkgver() {
  cd "${srcdir}/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

source=("git+${url}.git")
	
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_name}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

