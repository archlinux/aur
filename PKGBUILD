# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

_pkgname=iris
pkgname=mopidy-${_pkgname}
pkgver=3.4.1
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
sha256sums=('fd2d96bea32319b55bfe5b471c3de8e39db917f241d9276d9f7e945dac90d211')

package() {
  cd "${srcdir}/Mopidy-Iris-${pkgver}"
  PIP_CONFIG_FILE=/dev/null pip2 install \
    --isolated \
    --root="${pkgdir}" \
    --ignore-installed \
    --no-deps .
}
