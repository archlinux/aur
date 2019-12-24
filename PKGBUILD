# Maintainer: Sasha Moak <sasha dot moak at gmail dot com>

pkgname=mopidy-musicbox
_pypiname=Mopidy-MusicBox-Webclient
pkgver=3.0.1
pkgrel=1
pkgdesc="Web Client for Mopidy Music Server and the Pi MusicBox"
arch=('any')
url="https://github.com/woutervanwijk/Mopidy-MusicBox-Webclient"
license=('APACHE')
depends=('python' 'mopidy>=3.0' 'python-pykka')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/90/b9/ffdbb35edcaeb7b957a0bf0c19134e4da7eec12826596761180fdfda2461/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('1f094c55d3034159ecba511a1e57ec300336f560f8d910d58ee7dd406409d0ff')

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
