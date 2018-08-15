# Maintainer: sumt <sumt at sci dot fi>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=python2-yle-dl
pkgver=2.35
pkgrel=2
pkgdesc="Download video and audio from YLE Areena."
arch=('any')
url="http://aajanki.github.io/yle-dl/"
license=('GPL3')
depends=('ffmpeg'
       'python2-attrs>=17.4.0'
       'python2-attrs<18.1.0'
       'python2-configargparse'
       'python2-future'
       'python2-lxml'
       'python2-mini-amf'
       'python2-pycryptodomex'
       'python2-pysocks'
       'python2-requests'
       'wget'
)
optdepends=('php: for downloading live TV and certain news broadcasts'
            'rtmpdump: for downloading Areena audio streams'
	    'python2-youtube-dl: an alternative downloader backend to AdobeHDS.php')
makedepends=('python2-setuptools')
provides=("yle-dl=$pkgver")
conflicts=('yle-dl')
source=("yle-dl-$pkgver.tar.gz::https://github.com/aajanki/yle-dl/archive/${pkgver}.tar.gz")
md5sums=('56a35002413d3fb8050e7ef94d693c5a')

build() {
  cd "yle-dl-$pkgver"
  python2 setup.py build
}

package() {
  cd "yle-dl-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

