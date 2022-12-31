# Copyright 2022 Tim Hildering

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Maintainer: Tim Hildering <hilderingt@posteo.net>

pkgname=overlayroot
pkgver=1.0
pkgrel=1
pkgdesc="Overlay the root filesystem with a tmpfs filesystem."
arch=('any')
url="https://github.com/hilderingt/archlinux-overlayroot"
license=('GPLv3')
depends=(
  'mkinitcpio'
)
source=(
  'overlayroot-install.hooks'
  'overlayroot-runtime.hooks'
  'mount.overlayroot'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

build() {
  :
}

package() {
  install -Dm644 "$srcdir/overlayroot-install.hooks" "$pkgdir/usr/lib/initcpio/install/overlayroot"
  install -Dm644 "$srcdir/overlayroot-runtime.hooks" "$pkgdir/usr/lib/initcpio/hooks/overlayroot"
  install -Dm755 "$srcdir/mount.overlayroot" "$pkgdir/usr/bin/mount.overlayroot"
}
