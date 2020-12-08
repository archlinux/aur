# Copyright (C) 2019 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

pkgname=python-bundlewrap
_pkgname=bundlewrap
pkgver=4.2.2
pkgrel=1
pkgdesc="Agent-less configuration management"
arch=('any')
url='https://bundlewrap.org/'
license=('GPL3')
depends=('python-cryptography'
	 'python-jinja'
	 'python-mako'
	 'python-passlib'
	 'python-pyaml'
	 'python-requests'
	 'python-six'
	 'python-tomlkit')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('d1a9e1d09c8054f964963a0b2bd8ee5d4625b0abda43d2bd6fdfaec3cf01ad555eca2369740ef05159925cd4e0aa32e439fe4fb8eb604db0e19d064698dde233')

build(){
  cd "$srcdir/bundlewrap-$pkgver"
  python3 setup.py build
}

package(){
  cd "$srcdir/bundlewrap-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
