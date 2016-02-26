#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# ogMaintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>
# Contributor: Ghost of Kendo <ghostofkendo at gmail dot com>

pkgname=python2-netifaces
pkgver=0.10.9
pkgrel=3
pkgdesc="Portable module to access network interface information in Python"
arch=('x86_64')
url="https://alastairs-place.net/netifaces/"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.io/packages/source/n/netifaces/netifaces-${pkgver}.tar.gz")
sha512sums=('8fc593de4d2cbda46a3e2430ede031360f1abfc64d47d00fbec09f3395fd83479bf29d97cb6834b1df06850c9ac2745c9344b6814f34be5975d4d5df98e05e87')

package() {
  cd "${srcdir}/netifaces-${pkgver}"
  python2 setup.py install --root "${pkgdir}"

  # Install license, that is inside the readme file
  install -Dm644 README.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
