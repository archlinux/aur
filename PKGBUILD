# Maintainer: LLL2yu <lll2yu@protonmail.com>
# Co-maintainer: katt <magunasu.b97@gmail.com>

pkgname=gallery-dl
pkgver=1.14.1
pkgrel=1
pkgdesc="Command-line program to download image-galleries and collections from several image hosting sites"
arch=('any')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python' 'python-requests')
makedepends=('python-setuptools')
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
	    'youtube-dl: Download videos')
source=("$url"/releases/download/v"${pkgver}"/"${pkgname/-/_}"-"${pkgver}".tar.gz{,.asc})
validpgpkeys=('3E09F5908333DD83DBDCE7375680CA389D365A88') #Mike Fährmann
sha512sums=('3a789dd94dcc61e49ae91fee8bd2fd9073b8d4d0b9461a5d07bbafab080b0346ff3d182e1773ed95bb1a51b9f404f65c54fb17674f9051d5d9bb2b3cd1c39035'
            'SKIP')

package() {
  cd ${pkgname/-/_}-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
