# Copyright (C) 2025 Vadim Yanitskiy <fixeria@osmocom.org>
# Copyright (C) 2020 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
pkgname=simtrace2
pkgver=0.8.1
pkgrel=1
pkgdesc="Traces the communication between phones and SIM cards with second generation simtrace hardware."
arch=('armv7h' 'i686' 'x86_64')
url="https://osmocom.org/projects/simtrace2"
license=('GPL-2.0-only') # GPLv2-only according to the source files headers
depends=('libosmocore' 'libusb' 'talloc')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-host-${pkgver}.tar.bz2")
sha256sums=('553d84c7979af85c6c86c1859d7c5437c089265beeabb8278f5f1df739796516')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
