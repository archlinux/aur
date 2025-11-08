# Copyright 2025 Tim Hildering

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

pkgname=archlinux-overlayroot
pkgver=0.9.0
pkgrel=1
pkgdesc="Overlay the root filesystem with a tmpfs filesystem."
arch=('any')
url="https://github.com/hilderingt/archlinux-overlayroot"
license=('GPLv3')
depends=(
  'mkinitcpio'
)
source=(
  'install.sh'
  'hook.sh'
  'mount.ovlroot'
  'ovlroot.sh'
)
sha256sums=(
  'e942049ddb9b0a5b853b1f182453e82f6beb945ace699f1cb1a0d2d95825d619'
  'bcf1c2d640e54988fd58ee37fa9077e3bd74684a0823cb55f89ef8afe1f33500'
  'c6e15e20c35897e653d80a5ce6b3b78700d8ff35052803401bb9b2c214c45bfc'
  '2948c07a187128024f705229851889a9b2e5a02c72dfa46143d7e49b49000f4b'
)

build() {
  :
}

package() {
  install -D -m 644 "$srcdir/install.sh" "$pkgdir/usr/lib/initcpio/install/ovlroot"
  install -D -m 644 "$srcdir/hook.sh" "$pkgdir/usr/lib/initcpio/hooks/ovlroot"
  install -D -m 755 "$srcdir/mount.ovlroot" "$pkgdir/usr/bin/mount.ovlroot"
  mkdir -p "$pkgdir/usr/share/ovlroot"
  install -D -m 644 "$srcdir/ovlroot.sh" "$pkgdir/usr/share/ovlroot/ovlroot.sh"
  install -d -m 700 -o root -g root "$pkgdir/etc/ovlroot.d"
}