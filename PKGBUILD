# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=python-nanopi-gpio-git
pkgver=0.6.3
pkgrel=2
pkgdesc="Python library for GPIO access on a Nano Pi"
url="https://github.com/auto3000/RPi.GPIO_NP"
license=(MIT)
provides=("python-raspberry-gpio")
conflicts=("python-raspberry-gpio")
arch=(armv6h armv7h)
depends=('python')
makedepends=('gcc' 'python-setuptools')
source=("git://github.com/auto3000/RPi.GPIO_NP/" "add_extern.patch")
sha256sums=('SKIP'
            'c3154fd834bf1cc58eee41d40b317e88d588542e387e34b757f59c7a96e69207')

prepare() {
    cd "${srcdir}/RPi.GPIO_NP"
    patch --forward --strip=1 --input="${srcdir}/add_extern.patch"
}

package() {
    cd "${srcdir}/RPi.GPIO_NP"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

