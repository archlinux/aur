# Maintainer: Khaled Rouissi <your.email@example.com>

pkgname=ma7rath
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple, elegant command-line timer application"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/khalidrouissi1/ma7rath"
license=('MIT')
depends=()
makedepends=('go>=1.16')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -o "${pkgname}" .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Install binary
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  
  # Create license file directly in the package
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << EOF
MIT License

Copyright (c) 2024 Khaled Rouissi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}
