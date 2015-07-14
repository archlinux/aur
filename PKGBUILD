# Maintainer: Pierre-Gildas MILLON <pgmillon@gmail.com> 

pkgname=python2-nuxeo-drive
pkgver=2.0.0626
pkgrel=1
pkgdesc="Desktop synchronization of local folders with remote Nuxeo workspaces"
arch=('any')
url="https://github.com/nuxeo/nuxeo-drive"
license=('GPLv2')
depends=('python2, python2-yappi>=0.94, python2-xattr>=0.7.7, python2-send2trash>=1.3.0, python2-argparse>=1.3.0, python2-coverage>=3.7.1, python2-esky>=0.9.8, python2-faulthandler>=2.4, python2-nose>=1.3.7, python2-poster>=0.8.1, python2-psutil>=3.0.1, python2-watchdog>=0.8.3, python2-universal-analytics-python>=0.2.4, python2-mock>=1.0.1, python2-crypto>=2.6.1, python2-qt4')
makedepends=('python2-setuptools')
source=("https://github.com/nuxeo/nuxeo-drive/archive/release-$pkgver.tar.gz")
md5sums=('e07715d709bd97ebad49d87ab04e76dd')

build() {
  cd "${srcdir}/nuxeo-drive-release-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/nuxeo-drive-release-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
