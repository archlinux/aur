# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=youtube-music-uploader
pkgver=1.3.3
pkgrel=1
pkgdesc="YouTube music uploader."
arch=('any')
url="https://github.com/jaymoulin/youtube-music-uploader"
license=('MIT')
depends=('python-requests' 'python-watchdog' 'python-ytmusicapi')
makedepends=('python-setuptools')
source=("https://github.com/jaymoulin/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1edb2e47567ee7eaff59cf7a85d3a2538a341f401d8124fbfdce84358f860b0e')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
