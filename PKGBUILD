# Maintainer: Dracape <Dracape at outlook dot com>

pkgname=symp-git

# Version
pkgver=5.2.6.r0.gdc45435
pkgrel=1

# Generic
pkgdesc='Populate directories with least amount of symlinks'
arch=(any)
url='https://github.com/Dracape/SymP'
license=('MIT')

# Dependencies
depends=('fish' 'fd')
makedepends=('fish' 'fd' 'git')
conflicts=('symp')
provides=("symp=${pkgver}")

# Download
source=("${pkgname}::git+https://github.com/Dracape/SymP.git")
b2sums=('SKIP')

# Functions
pkgver() { GIT_DIR="$pkgname"/.git git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'; }
package() { "$pkgname"/install.fish --vendor --repository="$pkgname" --rootdir=${pkgdir}; }
