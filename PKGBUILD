# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

_pkgname=iris
pkgname=mopidy-${_pkgname}
pkgver=3.0.4
pkgrel=1
pkgdesc='A Mopidy Web client that utilizes the Spotify and EchoNest frameworks. (Formerly Spotmop)'
arch=('any')
url="https://github.com/jaedb/${_pkgname}"
license=('APACHE')
depends=('python2' 'mopidy' 'mopidy-spotify' 'python2-configobj'
         'mopidy-local-images' 'python2-spotipy' 'python2-pylast')
makedepends=('python2' 'python2-setuptools' 'python2-pip')
optdepends=('mopidy-local-sqlite: local library support')
source=("https://files.pythonhosted.org/packages/source/M/Mopidy-Iris/Mopidy-Iris-${pkgver}.tar.gz")
sha256sums=('008df82c8226461eb9e27be37254624ff4c149c44854f3e4b8bc9661f74c9367')

package() {
  cd "${srcdir}/Mopidy-Iris-${pkgver}"
  PIP_CONFIG_FILE=/dev/null pip2 install \
    --isolated \
    --root="${pkgdir}" \
    --ignore-installed \
    --no-deps .
}
