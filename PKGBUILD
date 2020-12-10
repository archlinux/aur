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
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
_pkgname=wheezy.template
pkgname=python-wheezy
pkgver=3.0.3
pkgrel=1
pkgdesc="A lightweight template library"
arch=('any')
url="https://pypi.python.org/pypi/wheezy.template"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
conflicts=(
    'python2-wheezy'  # /usr/bin/wheezy.template
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1254ba402e2f5720885945be026a643cc6820ea9b721835c9242c826c1d3e670')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
