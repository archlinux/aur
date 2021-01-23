# Maintainer: LLL2yu <lll2yu@protonmail.com>
# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=gallery-dl
pkgver=1.16.4
pkgrel=1
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites'
arch=('any')
url='https://github.com/mikf/gallery-dl'
license=('GPL2')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
            'youtube-dl: Download videos')
source=("${url}"/releases/download/v"${pkgver}"/"${pkgname/-/_}"-"${pkgver}".tar.gz{,.asc})
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88') #Mike Fährmann
sha512sums=('deba4d88e48d8c8e803d4a7917f201df7756d1d47d93efbb6288b5c0cc10b38e99100320643ec1b0015490728414aa3885df27ff10efea0f9f217bc7545ddda9'
            'SKIP')

package() {
    cd ${pkgname/-/_}-${pkgver}
    python setup.py install -O1 --root="${pkgdir}"
}
