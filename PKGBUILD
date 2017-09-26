# Maintainer: johnjq <dev [at] johnjq (dot) com>

pkgname=python-libkeepass
pkgver=0.2.0
pkgrel=1
pkgdesc="Python module to read KeePass 1.x/KeePassX (v3) and KeePass 2.x (v4) files"
arch=("any")
url="https://github.com/libkeepass/libkeepass"
license=("GPL")
depends=("python" "python-crypto" "python-lxml")
makedepends=("python-setuptools")
options=("!emptydirs")
source=("https://codeload.github.com/libkeepass/libkeepass/tar.gz/$pkgver")
sha512sums=("6430128eb8585c9f57be877279916ed57097b8378bc54cd1ab45cb361abc73ac6ca85d737ba70e77b2a33739ee63a94c548aa9169397700ec5a8b77d8b4ec36b")

package() {
    cd "$srcdir/libkeepass-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -m 644 -D LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
