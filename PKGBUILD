# Maintainer: Nikhil Singh <nik.singh710@gmail.com>
pkgname=please_cli
pkgver='0.3.1'
pkgrel=1
pkgdesc="Please CLI - Minimalistic New Tab Page CLI Tool with a greeting, date and time, inspirational quotes and your personal tasks and to-do list "
arch=(any)
url="https://github.com/NayamAmarshe/please"
license=('MIT')
depends=("python-typer" "python-rich")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/NayamAmarshe/please/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('SKIP')
provides=('please')
conflicts=('please')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}"
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
