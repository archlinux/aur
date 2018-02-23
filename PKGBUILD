# Maintainer: sumt <sumt at sci dot fi>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=python2-yle-dl
pkgver=2.31
pkgrel=2
pkgdesc="Download video and audio from YLE Areena."
arch=('any')
url="http://aajanki.github.io/yle-dl/"
license=('GPL3')
depends=('ffmpeg' 'python2-crypto' 'python2-future' 'python2-lxml'
         'python2-pyamf' 'python2-pysocks' 'python2-requests' 'python2-youtube-dl' 'wget')
optdepends=('php-mcrypt: for AdobeHDS.php based downloader backend'
            'rtmpdump: for downloading Areena audio streams')
makedepends=('python2-setuptools')
provides=("yle-dl=$pkgver")
conflicts=('yle-dl')
source=("yle-dl-$pkgver.tar.gz::https://github.com/aajanki/yle-dl/archive/${pkgver}.tar.gz")
md5sums=('515e424f0be8125a937ea0bc8da11727')

package() {
  cd "yle-dl-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

