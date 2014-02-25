# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=iosshy
pkgver=1.6
pkgrel=5
pkgdesc="An easy to use desktop tool to quickly create and destroy SSH tunnels and launch commands based on a preconfigured setup."
arch=('any')
url="http://kde-apps.org/content/show.php/IOSSHy?content=119689"
license=('BSD')
depends=('python2-pyqt' 'python2-setproctitle' 'python2-paramiko' 'python2-keyring' 'pycrypto')
makedepends=('python2-setuptools')
optdepends=('kdebindings-python: KDE integration')
source=($pkgname-$pkgver.tar.gz::https://github.com/mtorromeo/$pkgname/tarball/v$pkgver iosshy.desktop)

build() {
	cd "$srcdir/mtorromeo-iosshy-ef4ee08"
	sh build.sh
}

package() {
	cd "$srcdir/mtorromeo-iosshy-ef4ee08"
	python2 setup.py install -O2 --root="$pkgdir"
	install -m0644 -D "$srcdir/iosshy.desktop" "$pkgdir/usr/share/applications/iosshy.desktop"
	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

sha256sums=('ec774f07e698141a37c4144e3adafa1d0af98c51f517c20e3cccffd360b323a3'
            '9090d95bb9aa655cc94feecec931a80c8e51efe9d8e6a45c66acf25efa054843')
