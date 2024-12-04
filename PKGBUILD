pkgname=virtnbdbackup
pkgver=2.18
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


sha256sums=('75bf0e84d6a9c411aadd6ce13e68f0c84099942557aefb89bcd4155ee17d6e99')
