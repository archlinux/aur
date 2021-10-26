#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: awh

pkgname=python-pytweening
_name=pytweening
pkgver=1.0.4
pkgrel=1
pkgdesc="A set of tweening / easing functions implemented in Python."
arch=('any')
url="https://github.com/asweigart/pytweening"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('0ca099f81e90a719ab1d1ea5aa11cd389d326e8697bfe879fbe89d62d054e07d37972787af9f897a6650cbc55785713a48d97dbe8d7e3f1f17363e50f840483c')

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
