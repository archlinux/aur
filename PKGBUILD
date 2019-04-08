# Maintainer: sumt <sumt at sci dot fi>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>
# Contributor: ZaZam <zazaamm ät gmail dt com>

pkgname=yle-dl
pkgver=20190331
pkgrel=1
pkgdesc="Download video and audio from YLE Areena."
arch=('any')
url="http://aajanki.github.io/yle-dl/"
license=('GPL3')
depends=('ffmpeg'
       'python-attrs>=18.1.0'
       'python-attrs<19.2.0'
       'python-configargparse>=0.13.0'
       'python-future'
       'python-lxml'
       'python-mini-amf'
       'python-pycryptodomex'
       'python-requests'
)
optdepends=('php: for downloading live TV and certain news broadcasts'
            'rtmpdump: for downloading some  Elävä Arkisto streams'
	    'youtube-dl: an alternative downloader backend to AdobeHDS.php'
            'wget: for some rare streams')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/y/yle-dl/yle-dl-${pkgver}.tar.gz")
sha256sums=('2664416b44c33188bd41b7bef70ebcf1d12a74ecae4a16bfc60965340534bfdd')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
