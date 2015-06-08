# Contributor: Arnaud Durand-Favreau <biginoz at FREE point FR>
# Maintainer: Bjoern Franke <bjo at nord-west.org>
pkgname=stapler
pkgver=0.4
pkgrel=3
pkgdesc="A small utility making use of the pypdf library to provide a (somewhat) lighter alternative to pdftk"
arch=('any')
url="https://github.com/fwenzel/stapler"
license=('BSD')
depends=('python2-pypdf2')
conflicts=('stapler-git')
source=("https://github.com/fwenzel/stapler/archive/$pkgver.zip")

md5sums=('cdcde78931514816a39822952a34a05b')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's_#!/usr/bin/env python$_#!/usr/bin/env python2_' stapler
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -rv "${srcdir}/${pkgname}-${pkgver}/"* "${pkgdir}/opt/${pkgname}"
  install -d ${pkgdir}/usr/bin
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
