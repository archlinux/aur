# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-ctfcli
pkgver=0.0.7
pkgrel=1
pkgdesc="Tool for creating and running Capture The Flag competitions"
arch=('any')
url='https://github.com/CTFd/ctfcli'
license=('Apache')
depends=('python'
	'python-cookiecutter>=1.6.0'
	'python-click>=7.0'
	'python-fire>=0.2.1'
	'python-yaml>=5.2'
	'python-pygments>=2.5.2'
	'python-requests>=2.22.0'
	'python-colorama>=0.4.3'
	'python-appdirs>=1.4.3')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/c/ctfcli/ctfcli-$pkgver.tar.gz")
sha256sums=('8ecdc2d1ef6ae3b416cd5724be4aa8385a815158ee24cdf04a63fa31f1313273')

build() {
	cd "${srcdir}/ctfcli-${pkgver}"
	python setup.py build
}

package() {
	cd "ctfcli-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
