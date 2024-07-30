pkgname=virtnbdbackup
pkgver=2.11
pkgrel=1
pkgdesc="Backup utility for Libvirt / qemu / kvm"
url="https://github.com/abbbi/virtnbdbackup"
arch=('any')
license=("GPL-3.0")
depends=(python python-colorlog python-typing_extensions libvirt-python python-lxml python-tqdm python-paramiko python-lz4 libnbd)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://github.com/abbbi/virtnbdbackup/releases/download/v$pkgver/virtnbdbackup-$pkgver.tar.gz")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m installer -d "$pkgdir" \
		dist/*.whl
}


sha256sums=('63e96f4c357789f28084bc34a019bbea7a5f52ccec01b2c62fd3f3c9ec3a5076')
