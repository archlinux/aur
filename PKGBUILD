# Maintainer: zocker_160 <zocker1600 at posteo dot net>
# Co-maintainer: johnjq <dev [at] johnjq (dot) com>
# Co-maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=python-uinput
pkgver=1.0.1
pkgrel=2
pkgdesc='Pythonic API to Linux uinput kernel module'
arch=('x86_64' 'aarch64')
url='https://github.com/pyinput/python-uinput.git'
license=('GPLv3')

depends=('python' 'glibc' 'systemd-libs')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
options=('!emptydirs')

source=("git+https://github.com/pyinput/python-uinput.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -m644 -D COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
