# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# cargo-dist release artifacts (glibc x86_64 build); no aarch64 linux binary
# is published, so the source package covers that arch. The tarball carries
# only the ft binary plus README/CHANGELOG; no license file ships anywhere
# (repo, crate, release tarball), Cargo.toml says MIT, so the text is written
# out here with the author's attribution.

pkgname=fibertools-rs-bin
_pkgname=fibertools-rs
_tag=v0.13.1
pkgver=0.13.1
pkgrel=1
pkgdesc="Fiber-seq toolkit for creating and interacting with Fiber-seq BAM files"
arch=('x86_64')
url="https://github.com/fiberseq/fibertools-rs"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("fibertools-rs=$pkgver")
conflicts=('fibertools-rs')
options=('!strip' '!debug')
source=("$url/releases/download/$_tag/$_pkgname-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('080d5178b75948d4579843414d74ecec65367b6d708879551a91f9d16bb7380f')

package() {
    install -Dm755 "$srcdir/$_pkgname-x86_64-unknown-linux-gnu/ft" "$pkgdir/usr/bin/ft"
    cat > LICENSE <<'EOF'
MIT License

Copyright (c) 2021 Mitchell R. Vollger

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
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
