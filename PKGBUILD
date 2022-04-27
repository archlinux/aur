# Copyright (C) 2019 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the CC0 1.0 License.

pkgname=python-bundlewrap
_pkgname=bundlewrap
pkgver=4.7.0
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
sha512sums=('0b12c583bd37ad34e956b4c1c2eed7422acbdef6ed434bf3ce6c61e76ebad5adff78353195a01dadfc91a21bc6e23428200ed28a09a22ecd5729bf2243bfd828')

build(){
  cd "$srcdir/bundlewrap-$pkgver"
  python3 setup.py build
}

package(){
  cd "$srcdir/bundlewrap-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
