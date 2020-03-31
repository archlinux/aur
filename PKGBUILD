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
pkgver=20200325
_commit='1eca1d61245dbb1b24be23a4fb75e98b56aaeb6a'
pkgrel=1
pkgdesc='Google Compute Engine OS login support'
arch=('x86_64')
url='https://github.com/GoogleCloudPlatform/guest-oslogin'
license=('Apache')
depends=('curl' 'json-c' 'pam')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GoogleCloudPlatform/guest-oslogin/archive/$_commit.tar.gz")
sha256sums=('c7c19993b86d9820c0e4d981ab84c3fde201ae6b5f54e20b37c059735f15fd1c')

build() {
	cd "guest-oslogin-$_commit"
	make
}

package() {
	cd "guest-oslogin-$_commit"
	make DESTDIR="$pkgdir/" install
}
