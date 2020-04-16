# Maintainer: Michael Picht <mipi@fsfe.org>
#
# SPDX-FileCopyrightText: 2018-2020 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later
 
pkgname=crema
pkgver=2.2.0
pkgrel=1
pkgdesc="Manage (remote) custom repositories"          
arch=(any) 
url="https://gitlab.com/mipimipi/$pkgname"  
license=(GPL3) 
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")         
md5sums=(SKIP) 
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
depends=( 
    devtools
    git
    pacman
    rsync
    sudo
) 
makedepends=(
    git
    go
    make
    pandoc
) 
optdepends=(gnupg) 
provides=(crema)
conflicts=(crema-git)
 
build() { 
    cd "${pkgname}-${pkgver}"
    make
} 
 
package() { 
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install 
} 
