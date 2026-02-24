# Maintainer: Dracape <Dracape at outlook dot com>

pkgname=arch-upgrader-git

# Version
pkgver=1.1.0.r0.gbf08ba8
pkgrel=2

# Generic
pkgdesc='Update Arch: pacman & flatpak, rank mirrors, send notification on update and failure'
arch=(any)
url='https://github.com/Dracape/arch-upgrader'
license=('MIT')

# Dependencies
depends=('fish' 'rate-mirrors' 'gnome-console')
makedepends=('fish' 'git')
conflicts=('arch-upgrader')
provides=("arch-upgrader=${pkgver}")

# Download
source=("${pkgname}::git+https://github.com/Dracape/arch-upgrader.git")
b2sums=('SKIP')

# Functions
pkgver() { GIT_DIR="$pkgname"/.git git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'; }
package() { "$pkgname"/install.fish --repository="$pkgname" --rootdir=${pkgdir}; }
