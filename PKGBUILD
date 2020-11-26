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
pkgname=brcmfmac43456-firmware
pkgver=20190114
_dpkgrel="1+rpt9"
pkgrel=1
epoch=
pkgdesc="brcmfmac43456 firmware for Raspberry Pi 400"
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
source=("http://archive.raspberrypi.org/debian/pool/main/f/firmware-nonfree/firmware-brcm80211_${pkgver}-${_dpkgrel}_all.deb")
noextract=("firmware-brcm80211_${pkgver}-${_dpkgrel}_all.deb")
sha256sums=('232ea04d66cc645a0bc33c0d30c16a83f0ceab3d4de19252661a10f6eaff87cb')
validpgpkeys=()

_files=(
  lib/firmware/brcm/brcmfmac43456-sdio.bin
  lib/firmware/brcm/brcmfmac43456-sdio.clm_blob
  lib/firmware/brcm/brcmfmac43456-sdio.txt
)

build() {
  mkdir -p "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  ar x "$srcdir/firmware-brcm80211_${pkgver}-${_dpkgrel}_all.deb"
  tar xf data.tar.xz
}

package() {
  cd "$pkgname-$pkgver"
  for f in "${_files[@]}"; do
    install -Dm644 "$f" "$pkgdir/usr/$f"
  done
}
