# Maintainer: sumt <sumt at sci dot fi>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=yle-dl
pkgver=2.33
pkgrel=1
pkgdesc="Download video and audio from YLE Areena."
arch=('any')
url="http://aajanki.github.io/yle-dl/"
license=('GPL3')
depends=('ffmpeg' 'python-future' 'python-lxml' 'python-mini-amf'
         'python-pycryptodomex' 'python-pysocks' 'python-requests' 'wget')
optdepends=('php: for downloading live TV and certain news broadcasts'
            'rtmpdump: for downloading Areena audio streams'
	    'youtube-dl: an alternative downloader backend to AdobeHDS.php')
makedepends=('python-setuptools')
provides=(${pkgname}=$pkgver)
conflicts=(${pkgname})
source=("$pkgname-$pkgver.tar.gz::https://github.com/aajanki/yle-dl/archive/${pkgver}.tar.gz")
md5sums=('6da30a1f61a7218a69681c6f8615d9f1')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

