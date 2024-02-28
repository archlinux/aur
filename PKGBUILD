pkgname=virtnbdbackup
pkgver=2.0
pkgrel=1
pkgdesc="Backup utility for Libvirt / qemu / kvm"
url="https://github.com/abbbi/virtnbdbackup"
arch=('any')
license=("GPL-3.0")
depends=(python python-colorlog python-typing-extensions libvirt-python python-lxml python-tqdm python-paramiko python-lz4 libnbd)
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


sha256sums=('41a7e1b4e3681443221af9badc664ca2cb0977802dd44e1b71d1e6337c1c1d7b')
