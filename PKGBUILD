# Maintainer: Stefan Gehr <stefangehr@protonmail.com>

_name=parallel-ssh
pkgname=python-parallel-ssh
pkgver=2.12.0
pkgrel=1
pkgdesc="Asynchronous parallel SSH client library."
arch=(any)
url="https://github.com/ParallelSSH/parallel-ssh"
license=(LGPL)
depends=(python-gevent python-ssh2)
makedepends=(python-setuptools python-jinja-time)
source=($pkgname-$pkgver.tar.gz::"https://github.com/ParallelSSH/parallel-ssh/archive/refs/tags/${pkgver}.tar.gz")
b2sums=("87b06975afdfe02bf96602d1f74c3f54ada8b0544a71a984b44538b81852c89d3fec739f02ce8582723d8ee3a7502c6bfbc272c6f6da439d62728fc22b4d5080")

build() {
	cd $_name-$pkgver
	python setup.py build
}

package(){
	cd $_name-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
