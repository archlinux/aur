# Copyright (C) 2019 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

pkgname=qdl
pkgver=1.0
pkgrel=2
pkgdesc="Tool to communicate with Qualcomm System On a Chip bootroms to install or execute code"
arch=('armv7h' 'i686' 'x86_64')
url='https://github.com/andersson/qdl'
license=('BSD')
depends=('libxml2')
source=("https://github.com/andersson/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('561b6ffaf26d063f107a0769b41d0ed02f1f6c4656b6284e653e8baf69b2f34d5f6051e54bb45ab55c028bb8bfa9b4e5218b796dbdb7ab7686576168b1b11d77')

build(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make prefix="/usr" DESTDIR="${pkgdir}" install

  # install license
  install -d "${pkgdir}/share/licenses/${pkgname}/"
  install LICENSE "${pkgdir}/share/licenses/${pkgname}/"
}
