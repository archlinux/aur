# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-dbxfs
_pkgname=dbxfs
pkgver=1.0.22
pkgrel=1
pkgdesc="User-space file system for Dropbox"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/dbxfs"
license=('GPL3')
depends=('fuse2' 'python-appdirs>=1.4,<2' 'python-block_tracing>=1.0,<2' 'python-dropbox>=3.38' 'python-keyring>=15.1,<16' 'python-privy>=6.0,<7' 'python-sentry_sdk>=0.3,<1' 'python-userspacefs>=1.0.6,<2')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.patch")
md5sums=('098d194c19459e2804d99d03fa94207f'
         '577ade35a9be1349b1a6f461245e5597')

prepare() {
    cd $_pkgname-$pkgver
    patch -Np1 -i "${srcdir}/$pkgname.patch"
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/"
}
