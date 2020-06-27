# Maintainer: LLL2yu <lll2yu@protonmail.com>
# Co-maintainer: katt <magunasu.b97@gmail.com>

pkgname=gallery-dl
pkgver=1.14.2
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
sha512sums=('7609b74d8722a51a977046ca10a7234abe046f5442392ff38c667107643d6b8abc4558f88249f4eadb6b5fd303c067aa70a5eefd520313e42678525993ba64f6'
            'SKIP')

package() {
  cd ${pkgname/-/_}-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
