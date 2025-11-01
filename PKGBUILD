pkgname=lib32-python311-bin
pkgdesc="Major release 3.11 of the Python high-level programming language (32-bit)"
pkgver=3.11.8
pkgrel=6
arch=('x86_64')
url="https://www.python.org/"
license=('PSF-2.0')
options=('!debug')
depends=('glibc' 'zlib' 'bzip2' 'openssl' 'libffi')
source=("https://github.com/shdwmtr/pybuilder/releases/download/v1.0.6/python-3.11.8-32-bit.tar.gz")
sha256sums=('5ac25f933e81f446c8fa8d64e9f006c1dc9ca8cb5f234e21d3579d537b4e1682')

package() {
    cd "$srcdir"
    
    # Create necessary directories
    install -dm755 "$pkgdir/opt/python-i686-$pkgver"
    install -dm755 "$pkgdir/usr/bin"

    # Extract and move files
    tar -xf "python-3.11.8-32-bit.tar.gz"
    cd python-build

    mv bin "$pkgdir/opt/python-i686-$pkgver/"
    mv lib "$pkgdir/opt/python-i686-$pkgver/"
    mv include "$pkgdir/opt/python-i686-$pkgver/"
    mv share "$pkgdir/opt/python-i686-$pkgver/"
}
