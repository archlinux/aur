#
# Bamboo - A Vietnamese Input method editor
# Copyright (C) 2018 Luong Thanh Lam <ltlam93@gmail.com>
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
#
# Author: Luong Thanh Lam <ltlam93@gmail.com>
# Contributor: Trần Công <nopain2110@gmail.com>
# Maintainer: Minh Ngo <iam.minhnc@outlook.com>

pkgname=ibus-bamboo-git
pkgver=0.8.3+RC6+0+ga436ca2
pkgrel=1
pkgdesc='A Vietnamese IME for IBus'
arch=(any)
license=(GPL3)
url="https://github.com/BambooEngine/ibus-bamboo"
depends=('ibus')
makedepends=('go' 'libx11' 'libxtst')
conflicts=(ibus-bamboo)
options=('!strip')
source=("$pkgname"::git+$url)
md5sums=('SKIP')

pkgver() {
 cd "$pkgname"
 git describe --long --tags | sed 's#v##;s#-#+#g'
}

build() {
 cd "$pkgname"
 make build
}

package() {
 cd "$pkgname"
 make DESTDIR="$pkgdir/" install
}
