# MIT License
#
# Copyright (c) 2020 Parola Marco
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Maintainer: Your Name <sonotsugipaa@gmail.com>
pkgname=ndd-git
pkgver=1.1
pkgrel=1
pkgdesc="A simple command-line number representation converter"
arch=('any')
url="https://github.com/Sonotsugipaa/ndd"
license=('custom:MIT')
makedepends=('git' 'gcc' 'cmake' 'sudo')
source=('https://github.com/Sonotsugipaa/ndd/archive/v1.1.tar.gz#43710bf')
md5sums=('1a361b4b4a8f26468708788a6b312953')

build() {
        echo "CD IN '$srcdir/${pkgname%-git}'" 1>&2
        cd "$srcdir/${pkgname%-git}-$pkgver"
        ./build.sh -r release
}

package() {
        cd "$srcdir/${pkgname%-git}-$pkgver"
        mkdir "$pkgdir"/usr
        mkdir "$pkgdir"/usr/bin
        ln release/build/bin/ndd "$pkgdir"/usr/bin/ndd
}
