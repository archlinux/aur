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
_pkgname=wheezy.template
pkgname=python-wheezy
pkgver=0.1.167
pkgrel=1
epoch=
pkgdesc="A lightweight template library"
arch=('any')
url="https://pypi.python.org/pypi/wheezy.template"
license=('MIT')
groups=()
depends=('python')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=(
    'python2-wheezy'  # /usr/bin/wheezy.template
)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://pypi.python.org/packages/b1/67/7f0a14a4cc9bd949b8d22383c26fec83a00e7bd428e15c697f998e3e37ba/wheezy.template-${pkgver}.tar.gz")
noextract=()
sha256sums=('a2ee933452f0352fb8587d79bf6fc66dbf3a14779ef7d17b9fa75e80c0003f19')
validpgpkeys=()

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  chmod +rwX -R "$pkgdir"  # by default installs with 700
}
