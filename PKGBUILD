# Copyright (C) 2020 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
pkgname=simtrace
pkgver=1.5
pkgrel=2
pkgdesc="Traces the communication between phones and SIM cards with first generation simtrace hardware."
arch=('armv7h' 'i686' 'x86_64')
url="https://osmocom.org/projects/simtrace/wiki/SIMtrace"
license=('GPL2') # GPLv2-only according to the source files headers
replaces=('simtrace-git')
depends=('libosmocore' 'libusb' 'lksctp-tools' 'talloc')
makedepends=('git')
source=("git://git.osmocom.org/simtrace.git#tag=v$pkgver")
sha512sums=('SKIP')

build() {
  cd "$srcdir/$pkgname/host"
  make
}

package() {
  cd "$srcdir/$pkgname/host"
  make DESTDIR=$pkgdir install
}
