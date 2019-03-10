# Copyright 2018 Google Inc. All Rights Reserved.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Maintainer: Lorenzo Castelli <lcastelli@gmail.com>
# Maintainer: Samuel Littley <samuellittley@google.com>

pkgname='growpart'
pkgver=0.31
pkgrel=1
pkgdesc='Extends a partition to fill available space'
arch=('any')
url='https://launchpad.net/cloud-utils'
license=('GPL3')
source=("https://launchpad.net/cloud-utils/trunk/$pkgver/+download/cloud-utils-$pkgver.tar.gz"
        'growpartfs'
        'growpartfs@.service')
sha256sums=('197c14ed7f2b566e5cd2ef03a46057d536a3e7bcb0b37a7a27fc378e691bd41d'
            '01576833fe3034c38f57b57b498f24ffe06263f6bcec25f79e57481aa854ac9b'
            'abb9633ea0a2bef1ae7c91b15267c1d901d63bb1d2f3caab76ecacc47a4b9c10')

package() {
	install -m755 -Dt "$pkgdir/usr/bin/" growpartfs
	install -m644 -Dt "$pkgdir/usr/lib/systemd/system/" growpartfs@.service

	cd "cloud-utils-$pkgver"
	install -m755 -Dt "$pkgdir/usr/bin/" bin/growpart
	install -m644 -Dt "$pkgdir/usr/share/man/man1/" man/growpart.1
}
