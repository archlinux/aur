# Maintainer: MoetaYuko <loli at yuko dot moe>

pkgname=python-pdf2video
pkgver=0.2.1
pkgrel=2
pkgdesc="A tool for making videos from PDF presentations"
url="https://github.com/tjunttila/pdf2video"
depends=('poppler' 'ffmpeg' 'aws-cli')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("pdf2video-$pkgver.tar.gz::https://github.com/tjunttila/pdf2video/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c9649653ffbd7e2069541681674a07c1131c48bb09cb0ad316b3ce1d15ec8479')

build() {
    cd $srcdir/pdf2video-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/pdf2video-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
