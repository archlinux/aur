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

# Maintainer: David Wu <xdavidwuph@gmail.com>
# Contributor: Lisa White <lisa.rsfp+dev@gmail.com>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
pkgname=hotdoc
pkgver=0.12.2
pkgrel=1
pkgdesc='The tastiest API documentation system'
arch=('x86_64') # parsers are built into native libraries
url='https://github.com/hotdoc/hotdoc'
license=('LGPL2.1')
depends=(
    'json-glib'
    'clang'
    'llvm'
    'python'
    'python-yaml'
    'python-lxml'
    'python-schema'
    'python-appdirs'
    'python-wheezy-0.1.167'
    'python-toposort'
    'python-xdg'
    'python-dbus-deviation'
    'python-pkgconfig-1.1.0'
    'python-cchardet'
    'python-networkx-1.11'
    'python-setuptools' # needed by hotdoc/utils/utils.py
)
makedepends=(
    'cmake'
    'flex'
    'git'
    'npm'
)
# upstream tarball does not contain submodules or their revision info
source=("git+https://github.com/${pkgname}/${pkgname}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
