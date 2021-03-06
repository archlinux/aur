# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.17.0
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
sha512sums=('4d511623ab1be001847ca8e1e9666c7ba6982b62d96d681ce8ac17e3a7b9eccf49fee06fc89234ffc3b1e24ba24bede20c0cccfcef09bc99d009c995fcbb5314'
            'SKIP')

package() {
    cd ${pkgname/-/_}-${pkgver}
    python setup.py install -O1 --root="${pkgdir}"
}
