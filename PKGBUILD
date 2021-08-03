#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=python-cx-freeze
pkgver=6.8b1
pkgrel=1
pkgdesc='Create standalone executables from Python scripts'
arch=('x86_64')
url='https://marcelotduarte.github.io/cx_Freeze'
license=('PSF')
depends=('python-importlib-metadata')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-openpyxl')
replaces=('python-cx_freeze')
provides=('python-cx_freeze')
conflicts=('python-cx_freeze')
source=("https://github.com/marcelotduarte/cx_Freeze/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('388d362815a502c155d8c41aafe769cddd320c7e58bd047c995b6456a9c746fbec8b5e3b4e133797cf2652eeb31afe25f43edee5b93f352904c89c66b2a273a2')

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
