# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=youtube-music-uploader
pkgver=1.3.4
pkgrel=1
pkgdesc="YouTube music uploader."
arch=('any')
url="https://github.com/jaymoulin/youtube-music-uploader"
license=('MIT')
depends=('python-requests' 'python-watchdog' 'python-ytmusicapi')
makedepends=('python-setuptools')
source=("https://github.com/jaymoulin/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('604b8aca9ef02da19a0d3e6f083b1c8c13273604334988f856c0969242a56787')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
