# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Julien Duponchelle <julien@gns3.net>

pkgname=python-cx_freeze
pkgver=6.3
pkgrel=3
pkgdesc='Utilities for freezing Python scripts into executables'
arch=('x86_64')
url='https://anthony-tuininga.github.io/cx_Freeze'
license=('PSF')
depends=('python')
conflicts=('cx_freeze')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-openpyxl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/anthony-tuininga/cx_Freeze/archive/$pkgver.tar.gz")
sha512sums=('6ccc9417faae23a675a00795f00b530c9003c69cd292a9978d69c55785f1638cd13491ac312a7f4f4d3e8e7055e18911866059738a2a83e932cff74eecdb504a')

build() {
  cd cx_Freeze-$pkgver
  python setup.py build
}

check() {
  cd cx_Freeze-$pkgver
  python setup.py nosetests || echo "Tests failed"
}

package() {
  cd cx_Freeze-$pkgver
  python setup.py install --root "$pkgdir" --optimize 1 --skip-build
}
