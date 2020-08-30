# Maintainer: LLL2yu <lll2yu@protonmail.com>
# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=gallery-dl
pkgver=1.14.5
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
sha512sums=('9088e46847df1839d6244c4ce97b9c04a3d85a7ae5279def6ee3591e1f257c8f128d40ca6f6a20cff0f44bfde7a14d92fd1ddacec27b55c115bdf7a04acb46b5'
            'SKIP')

package() {
    cd ${pkgname/-/_}-${pkgver}
    python setup.py install -O1 --root="${pkgdir}"
}
