# Copyright (C) 2019 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

pkgname=python-bundlewrap
_pkgname=bundlewrap
pkgver=4.3.0
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
sha512sums=('83cdfc182dd99698a8be8f31adde95c420951b76d3d9f0bd80afc894c2c2ed6f8ca74938f10b59e81aa8bcda6109d4e6066dcb36673353d3d3980614f66020e5')

build(){
  cd "$srcdir/bundlewrap-$pkgver"
  python3 setup.py build
}

package(){
  cd "$srcdir/bundlewrap-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
