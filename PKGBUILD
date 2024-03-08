#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: awh

pkgname=python-pytweening
_name=pytweening
pkgver=1.2.0
pkgrel=1
pkgdesc="A set of tweening / easing functions implemented in Python."
arch=('any')
url="https://github.com/asweigart/pytweening"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('ef3fc5c7778c8b996f0fcb92a92033031b97c8ea42d8f320dee1c835b3df8b527e16da1f71c26c08a2a55127d444f96e24cf1e982aae1b0b81a07b6f5576e22f')

build() {
	cd "$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
