# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-dbxfs
_pkgname=dbxfs
pkgver=1.0.20
pkgrel=2
pkgdesc="User-space file system for Dropbox"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/dbxfs"
license=('GPL3')
depends=('fuse2' 'python-appdirs' 'python-block_tracing' 'python-dropbox' 'python-keyring' 'python-privy' 'python-sentry_sdk' 'python-userspacefs')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('17c4d6ac005ae101b1639a8be55f0380')

prepare() {
	cd "$_pkgname-$pkgver"
    sed -e '108d' "$_pkgname/main.py"
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/"
}
