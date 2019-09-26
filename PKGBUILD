# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=python-beep-downloader-git
pkgver=r11.1e85665
pkgrel=1
pkgdesc="Beep downloader"
arch=("any")
url="https://github.com/edomora97/beep-downloader"
license=("MPL2")
depends=("python" "python-colorama" "python-requests" "python-beautifulsoup4")
makedepends=("python-setuptools")
source=("git+https://github.com/edomora97/beep-downloader.git")
sha1sums=("SKIP")

pkgver() {
    cd "$srcdir/beep-downloader"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/beep-downloader"
    python setup.py build
}

package() {
    cd "$srcdir/beep-downloader"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
