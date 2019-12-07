# Copyright 2018 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Maintainer: Lorenzo Castelli <lcastelli@google.com>
# Maintainer: Samuel Littley <samuellittley@google.com>

pkgname='google-compute-engine-oslogin'
pkgver=20191018
_commit='5a710bbee227f4413c51eefa180e1fbeebd1d11b'
pkgrel=1
pkgdesc='Google Compute Engine OS login support'
arch=('x86_64')
url='https://github.com/GoogleCloudPlatform/guest-oslogin'
license=('Apache')
depends=('curl' 'json-c' 'pam')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GoogleCloudPlatform/guest-oslogin/archive/$_commit.tar.gz")
sha256sums=('31b1409193b49f9cbaf72c00be5f9624cf9e0aa70ac0dc7cf6b5177c7e1b1ebf')

build() {
	cd "guest-oslogin-$_commit"
	make
}

package() {
	cd "guest-oslogin-$_commit"
	make DESTDIR="$pkgdir/" install
}
