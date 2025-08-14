# Maintainer: Mark Kiraly <mark.kiraly.hu@gmail.com>
pkgname=lingua
pkgver=1.0.0
pkgrel=1
pkgdesc="Speech translator primarily for language learning. Languages: English <-> Hungarian"
arch=('x86_64')
url="https://github.com/ProgrammerGnome/lingua"
license=('MIT')
depends=('python310' 'python-pip' 'python-numpy' 'ffmpeg')
makedepends=('git' 'cmake')
source=("https://github.com/ProgrammerGnome/lingua/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('730aeef9bf48953e7b43673510b3d42bc2919033e684811b681fcdaed073fc52')

build() {
    cd "$srcdir/lingua-$pkgver"
    # No build steps needed for pure Python package
}

package() {
    cd "$srcdir/lingua-$pkgver"
    python -m pip install --prefix=/usr --root="$pkgdir" --no-deps --no-cache-dir .
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
