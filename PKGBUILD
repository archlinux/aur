# Copyright 2018 Google LLC

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Maintainer: Aleksey Filippov <sarum9in@gmail.com>

pkgname=mtproxy-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Proxy server for Telegram messaging app"
arch=('i686' 'x86_64')
url='https://github.com/TelegramMessenger/MTProxy'
license=('GPLv2' 'LGPLv2')
depends=('zlib')
source=(
    "$pkgname::git+https://github.com/TelegramMessenger/MTProxy.git"
)
noextract=()
md5sums=(SKIP)

build() {
  cd "$srcdir/$pkgname"
  make $MFLAGS
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 755 objs/bin/mtproto-proxy "$pkgdir/usr/bin/mtproto-proxy"
}
