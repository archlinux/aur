# Maintainer: sumt <sumt at sci dot fi>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>
# Contributor: ZaZam <zazaamm ät gmail dt com>

pkgname=python2-yle-dl
pkgver=20181221
pkgrel=1
pkgdesc="Download video and audio from YLE Areena."
arch=('any')
url="http://aajanki.github.io/yle-dl/"
license=('GPL3')
depends=('ffmpeg'
       'python2-attrs>=18.1.0'
       'python2-attrs<18.3.0'
       'python2-configargparse'
       'python2-future'
       'python2-lxml'
       'python2-mini-amf'
       'python2-pycryptodomex'
       'python2-requests'
       'wget'
)
optdepends=('php: for downloading live TV and certain news broadcasts'
            'rtmpdump: for downloading Areena audio streams'
	    'python2-youtube-dl: an alternative downloader backend to AdobeHDS.php')
makedepends=('python2-setuptools')
provides=("yle-dl=$pkgver")
conflicts=('yle-dl')
source=("yle-dl-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/y/yle-dl/yle-dl-${pkgver}.tar.gz")
sha256sums=('8970960816151d0e296c0ab15b9371c0feea444567c59a7b2917bdf5f0de06fd')

build() {
  cd "yle-dl-$pkgver"
  python2 setup.py build
}

package() {
  cd "yle-dl-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

