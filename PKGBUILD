pkgname=virtnbdbackup
pkgver=2.9
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


sha256sums=('e49d58fecad7ce2644d256e24c205026420eacd3ab8231473553b9a3758aaf43')
