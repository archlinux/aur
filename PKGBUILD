# Copyright (C) 2019 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the CC0 1.0 License.
# Maintainer: Zoe Wetzel <aur@commanderred.xyz>

pkgname=python-bundlewrap
_pkgname=bundlewrap
pkgver=5.2.0
pkgrel=1
pkgdesc="Config management with Python"
arch=('any')
url='https://bundlewrap.org'
license=('GPL3')
depends=(
  'python'
  'python-bcrypt'
  'python-cryptography'
  'python-jinja'
  'python-librouteros>=3.0.0'
  'python-mako'
  'python-packaging>=25'
  'python-yaml'
  'python-requests>=1.0.0'
  'python-tomlkit'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('1ac993ebdbfbce65b37ecfc29580e3cc5ee7a8b5037f074050ba3a4028e1b6cafa29543d0913e2e52e2da6706654cb1e1703c5809f506d68443e3f759ab61c20')

build() {
  cd "$srcdir/bundlewrap-$pkgver"
  python3 setup.py build
}

package() {
  cd "$srcdir/bundlewrap-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
