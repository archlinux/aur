# Copyright 2020 Google LLC

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Maintainer: Lisa White <lisa.rsfp+dev@gmail.com>
pkgname=brcm80211-firmware
pkgver=20190114
_dpkgrel=2
pkgrel=1
epoch=
pkgdesc="A replica of firmware-brcm80211 from Debian"
arch=('any')
url=""
license=('non-free')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://ftp.de.debian.org/debian/pool/non-free/f/firmware-nonfree/firmware-brcm80211_${pkgver}-${_dpkgrel}_all.deb")
noextract=("firmware-brcm80211_${pkgver}-${_dpkgrel}_all.deb")
sha256sums=('4a02cfe6cd2e5862765b47daf9ca5dd1d192ce0c4077e0ea1fee13d854414f6e')
validpgpkeys=()

build() {
  mkdir -p "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  ar x "$srcdir/firmware-brcm80211_${pkgver}-${_dpkgrel}_all.deb"
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir"
  tar -C "$pkgdir" -xf data.tar.xz
}
