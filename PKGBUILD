# Maintainer: LLL2yu <lll2yu@protonmail.com>
# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=gallery-dl
pkgver=1.16.1
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
sha512sums=('8cd58e32e19d0c8efbf6191e817130cd5bee66db7ddbcb4acd745db60670441af6b1aeb15a9c381dab876f79f31ed45c634c6dfb024eb758e99ec089860ee120'
            'SKIP')

package() {
    cd ${pkgname/-/_}-${pkgver}
    python setup.py install -O1 --root="${pkgdir}"
}
