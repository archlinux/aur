# Maintainer: LLL2yu <lll2yu@protonmail.com>
# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=gallery-dl
pkgver=1.15.0
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
sha512sums=('43d7ab22e5967a87ad2ae9dff8a40b6bd4d4db7cb9293e66f7de9b0b96788974b6efc80e6a2070d56a2d6970ab1f657cf3947d165851f685de04aff5b2889325'
            'SKIP')

package() {
    cd ${pkgname/-/_}-${pkgver}
    python setup.py install -O1 --root="${pkgdir}"
}
