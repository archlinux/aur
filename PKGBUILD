# Maintainer: sumt <sumt at sci dot fi>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=yle-dl
pkgver=2.30
pkgrel=1
pkgdesc="Download video and audio from YLE Areena."
arch=('any')
url="http://aajanki.github.io/yle-dl/"
license=('GPL3')
depends=('ffmpeg' 'python-crypto' 'python-future' 'python-lxml'
         'python-pyamf' 'python-requests' 'youtube-dl' 'wget')
optdepends=('php-mcrypt: for AdobeHDS.php based downloader backend'
            'rtmpdump: for downloading Areena audio streams')
makedepends=('python-setuptools')
provides=(${pkgname}=$pkgver)
conflicts=(${pkgname})
source=("$pkgname-$pkgver.tar.gz::https://github.com/aajanki/yle-dl/archive/${pkgver}.tar.gz")
md5sums=('f632381c47aa09d8601912286e10d406')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

