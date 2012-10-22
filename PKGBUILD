# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
pkgname=iosshy
pkgver=1.6
pkgrel=2
pkgdesc="An easy to use desktop tool to quickly create and destroy SSH tunnels and launch commands based on a preconfigured setup."
arch=('any')
url="http://kde-apps.org/content/show.php/IOSSHy?content=119689"
license=('BSD')
depends=('python2-qt' 'python2-setproctitle' 'python2-paramiko' 'python-keyring' 'pycrypto')
makedepends=('python2-distribute')
optdepends=('kdebindings-python: KDE integration')
source=($pkgname-$pkgver.tar.gz::https://github.com/mtorromeo/$pkgname/tarball/v$pkgver iosshy.desktop)
build() {
	cd $srcdir/mtorromeo-iosshy-ef4ee08
	sh build.sh
	python2 setup.py install --root=$pkgdir
	install -m0644 -D $srcdir/iosshy.desktop $pkgdir/usr/share/applications/iosshy.desktop
	install -D LICENSE $pkgdir/usr/share/licenses/iosshy/COPYING
}
md5sums=('cea37a4e040f6ee197f4535c169ea864'
         '5c74b88b69a7b13c1dae274f8edc938d')
