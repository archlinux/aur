# JSON schema validation and parsing based on libjson-c (by Helmut Jacob)
# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname=jsonschema-c
_pkgname=jsonschema-c-git
pkgver=r16.4abad5a
pkgrel=1
epoch=1
pkgdesc="JSON schema validation and parsing based on libjson-c"
url="https://github.com/helmut-jacob/jsonschema-c"
license=(MIT)
arch=(x86_64)
depends=(glibc json-c)
makedepends=(git make libtool json-c)
provides=(jsonschema-c)
conflicts=(jsonschema-c)
source=("git+https://gitlab.com/arkadesOrg/jsonschema-c#branch=port_v2020-12")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # no tags are reachable from HEAD
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare()
{
	cd "${srcdir}/${pkgname}"
  libtoolize
	aclocal
	automake --add-missing
	autoconf
}


build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build; cd build
	../configure --prefix=/usr
	make
}


package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build; cd build
  DESTDIR="$pkgdir" make install
}
# Copyright (c) 2014-2025 Dominik Kummer <admin@arkades.org>, All Rights Reserved
#
# This file is part of Arkades (www.arkades.org).
#
# Arkades is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 2.1 of the License, or
# (at your option) any later version.
#
# Arkades is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with Arkades If not, see <http://www.gnu.org/licenses/>.
#
#
source=('git+file:///home/domson/git/jsonschema-c#branch=port_v2020-12')
