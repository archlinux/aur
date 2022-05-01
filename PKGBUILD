# Maintainer: Kyle MacLeod <aur.kmac5@recursor.net>

pkgname=mopidy-ytmusic
pkgver=0.3.5
pkgrel=1
pkgdesc="Mopidy extension for playing music from Youtube Music"

arch=('any')
url="https://github.com/OzymandiasTheGreat/mopidy-ytmusic"
license=('APACHE')
depends=(
  'mopidy'
  'python-certifi'
  'python-charset-normalizer'
  'python-idna'
  'python-importlib-metadata'
  'python-pykka'
  'python-pytube'
  'python-setuptools'
  'python-requests'
  'python-tornado'
  'python-urllib3'
  'python-zipp'
  'python-ytmusicapi')
makedepends=('python' 'git')

source=("$pkgname-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/Mopidy-YTMusic-${pkgver}.tar.gz")

package() {
  cd "Mopidy-YTMusic-${pkgver}"

  # TEMPORARY: fix Issue #53
  sed -i.bak 's/ytmusicapi>=0.20.0,<0.21.0/ytmusicapi>=0.20.0/' setup.py 

  python setup.py install --root="${pkgdir}/" --optimize=1
}

sha256sums=('3ba6244bc4e23683be0753250408ecb5381fbc5dcdea497c5af6ef8e5df7cc5e')
