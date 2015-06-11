# Package - A collection of packages for GNU/Linux
# Copyright (C) 2015  Lost Echo
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Maintainer: Lost Echo

# Version
pkgname=cyra
pkgdesc='A C++ command line parsing library'

pkgver=0.5.2beta
_srcver=0.5.2-beta

pkgrel=1

# Generic
arch=('i686' 'x86_64')

url='https://github.com/lost-echo/cyra'
license=('GPL')

# Sources
source=("https://github.com/lost-echo/cyra/archive/${_srcver}.tar.gz")
md5sums=('c784b5a1af5f2529adcf49550796734e')

# Options
options=('debug' '!strip' 'staticlibs')

# Building
build() {
    cd "${srcdir}/${pkgname}-${_srcver}"
    make
}

# Packaging
package() {
    cd "${srcdir}/${pkgname}-${_srcver}"
    
    make destdir="${pkgdir}" includedir=/usr/include libdir=/usr/lib install
    
    install -D --mode=644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
