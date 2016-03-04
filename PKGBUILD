# Maintainer: Euan Thoms <euan@potensol.com>
pkgname=netdrive-connector
pkgver=1.3.2
pkgrel=1
pkgdesc="Utility to setup mountable SFTP and WebDAV connections on Linux/UNIX systems."
arch=('any')
url="https://github.com/ethoms/netdrive-connector"
license=('BSD')
depends=('python2-pyqt4' 'openssh' 'openssh-askpass' 'sshfs' 'davfs2' 'expect')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/n/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('8d0ae5d77d27cd8b7613fb2ef2410a26f49c8e5ab4d4c8fb32d7c63a14b8848b')
install=$pkgname.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
