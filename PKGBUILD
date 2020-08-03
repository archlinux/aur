# Copyright (C) 2019 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

pkgname=python-bundlewrap
_pkgname=bundlewrap
pkgver=4.0.0
pkgrel=2
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
sha512sums=('4d696a97e6d612839315d3820e4efd1db73c59ac88db816e19a619dec54f94f84cb28517ee57bcbc26ee6436ea887c73cc906479132ba41cc31755f76e2e4c85')

build(){
  cd "$srcdir/bundlewrap-$pkgver"
  python3 setup.py build
}

package(){
  cd "$srcdir/bundlewrap-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
