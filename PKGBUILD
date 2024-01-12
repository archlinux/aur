# Maintainer: Kyle MacLeod <aur.kmac5@recursor.net>

pkgname=mopidy-ytmusic
pkgver=0.3.9
pkgrel=1
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

source=("$pkgname-${pkgver}.zip::$url/archive/refs/heads/master.zip")

package() {
  cd "mopidy-ytmusic-master"

  # change pytube dependency:
  sed -i 's/pytube>=12.1.0/pytube>=15/' setup.py

  python setup.py install --root="${pkgdir}/" --optimize=1
}

sha256sums=('474a7cbb7090051ba3f8deb13fa42b0bdfafe9882e298f2e660d6c2c5643fa5b')
