# Maintainer: Mario O.M. <marioortizmanero@gmail.com>
pkgname=vidify-audiosync
pkgver=0.3.0
pkgrel=1
pkgdesc="Audio synchronization feature for Vidify"
arch=("any")
url="https://github.com/vidify/audiosync"
license=("LGPL")
depends=("python" "fftw" "ffmpeg" "pulseaudio")
makedepends=("python-setuptools")
source=("https://github.com/vidify/audiosync/archive/v$pkgver.tar.gz")
md5sums=('86dead703d02f70569d67659df77bcbf')

build() {
    cd "audiosync-$pkgver"
    python setup.py build
}

package() {
    cd "audiosync-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
