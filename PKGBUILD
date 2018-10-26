# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-dbxfs
_pkgname=dbxfs
pkgver=1.0.35
pkgrel=1
pkgdesc="User-space file system for Dropbox"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/dbxfs"
license=('GPL3')
depends=('fuse2' 'python-appdirs' 'python-block_tracing' 'python-dropbox' 'python-keyring' 'python-privy' 'python-sentry_sdk' 'python-userspacefs')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.patch")
md5sums=('f4e159043ac4b5e7f1be56bc2538c93b'
         '3bf993bef07b19ff2bafec3eeb4ff72a')

prepare() {
    cd $_pkgname-$pkgver
    patch -Np1 -i "${srcdir}/$pkgname.patch"
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/"
}
