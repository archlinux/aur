# Maintainer: Alexander Phinikarides <alexisph at gmail dot com>

_name="whatlastgenre"
_module="${_name}"

pkgname=("python2-${_module}")
pkgver="0.1.28"
pkgrel="1"
pkgdesc="Improve genre metadata of audio files based on tags from various music sites."
arch=("any")
depends=('python2')
url="https://yetanothernerd.github.io/whatlastgenre/"
license=("MIT")
makedepends=("python2-setuptools")
source=("https://github.com/YetAnotherNerd/${_name}/archive/v${pkgver}.zip")
sha256sums=('40f926abce8935e68a25fbcf9bb94311a95c0a5610bc56370b8397d52a38301e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    depends=("python2-requests" "mutagen")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
