# Maintainer: LLL2yu <lll2yu@protonmail.com>
# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=gallery-dl
pkgver=1.14.3
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
sha512sums=('6fd06f6e88fc308140a0c4edf0d99a0e35d0ff68ff6f9db0a89d682e7774bbe57030b634096ff17b20ac07c5f1f6c5a0a06af099059ccc1880ea8bed068a12d2'
            'SKIP')

package() {
    cd ${pkgname/-/_}-${pkgver}
    python setup.py install -O1 --root="${pkgdir}"
}
