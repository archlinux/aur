# Maintainer: sumt <sumt at sci dot fi>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=yle-dl
pkgver=2.35
pkgrel=2
pkgdesc="Download video and audio from YLE Areena."
arch=('any')
url="http://aajanki.github.io/yle-dl/"
license=('GPL3')
depends=('ffmpeg' 'wget')
optdepends=('php: for downloading live TV and certain news broadcasts'
            'rtmpdump: for downloading Areena audio streams'
	    'youtube-dl: an alternative downloader backend to AdobeHDS.php')
makedepends=('python-setuptools')
provides=(${pkgname}=$pkgver)
conflicts=(${pkgname})
source=("$pkgname-$pkgver.tar.gz::https://github.com/aajanki/yle-dl/archive/${pkgver}.tar.gz")
md5sums=('56a35002413d3fb8050e7ef94d693c5a')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

