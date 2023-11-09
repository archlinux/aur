# Maintainer: Kyle MacLeod <aur.kmac5@recursor.net>

pkgname=mopidy-ytmusic
pkgver=0.3.8
pkgrel=2
pkgdesc="Mopidy extension for playing music from Youtube Music"

arch=('any')
url="https://github.com/jmcdo29/mopidy-ytmusic"
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

source=("$pkgname-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")

package() {
  cd "mopidy-ytmusic-${pkgver}"

  # change pytube dependency:
  sed -i 's/pytube>=12.1.0,<13.0.0/pytube>=15/' setup.py

  python setup.py install --root="${pkgdir}/" --optimize=1
}

sha256sums=('14309ed1705cb1f67dc3502ff94387df3c8116d6c5947ba574f91f5744bb1108')
