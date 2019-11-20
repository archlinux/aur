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
# Maintainer: Luong Thanh Lam <ltlam93@gmail.com>
# Contributor: Tran Van Cong 


pkgname=ibus-bamboo
pkgver=0.6.2
pkgrel=1
[[ $pkgrel -eq 1 ]] && _pkgver=$pkgver || _pkgver="$pkgver-$((pkgrel-1))"
pkgdesc='A Vietnamese IME for IBus'
arch=(any)
license=(GPL3)
url="https://github.com/BambooEngine/ibus-bamboo"
depends=('ibus')
makedepends=('go' 'libx11' 'libxtst')
source=("$pkgname-$_pkgver.tar.gz"::"https://github.com/BambooEngine/$pkgname/archive/v$_pkgver.tar.gz")
sha256sums=('15fbee26a71d6c1dc0661cc29e00c12a116d93211e8097af914ab3e72549a774')
options=('!strip')
conflicts=(ibus-bamboo-git)

build() {
  cd "$pkgname-$_pkgver"

  make
}


package() {
  cd "$pkgname-$_pkgver"

  make DESTDIR="$pkgdir/" install
}
