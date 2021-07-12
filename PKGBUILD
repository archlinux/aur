# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=python2-bloom
_name=${pkgname#python2-}
pkgver=0.10.7
pkgrel=1
pkgdesc="A release automation tool"
url="https://www.ros.org/wiki/bloom"
depends=('python2' 'python2-catkin_pkg' 'python2-setuptools' 'python2-empy'
         'python2-dateutil' 'python2-pyaml' 'python2-rosdep' 'python2-rosdistro'
         'python2-vcstools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7038093de4448e0d8f172d0334c3089f77cbe7f7151ea59e2b7c0d9ea4033e8e')

build() {
	cd "$_name-$pkgver"
	python2 setup.py build
}

package() {
	cd "$_name-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
