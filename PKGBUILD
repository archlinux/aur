# Maintainer: Diego Ascânio Santos <ascanio@cefetmg.br>

MIT_LICENSE="MIT License

Copyright (c) 2017 Vadim Grigoruk

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE."

pkgname=tic80
pkgver=1.1.2837
pkgrel=1
pkgdesc="TIC-80 is a fantasy computer for making, playing and sharing tiny games."
arch=('x86_64')
url="https://tic80.com"
license=('MIT')
depends=('libglvnd')
source=(
    'https://github.com/nesbox/TIC-80/releases/download/v1.1.2837/tic80-v1.1-linux.deb'
)
sha256sums=(
    '2d003e68485579af11807b6c527f27a17a5197297f75114dc02c19ad24924b15'
)

package() {
    cd "$srcdir"
    echo "$MIT_LICENSE" > LICENSE
    ar x tic80-v1.1-linux.deb
    tar -xzf data.tar.gz -C "$pkgdir"

    # Create a license directory
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    # Install the license file
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
