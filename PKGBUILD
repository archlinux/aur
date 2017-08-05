# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=img2pdf
pkgver=0.2.4
pkgrel=1
pkgdesc="Losslessly convert images to PDF without unnecessarily increasing file size by re-encoding JPEG files."
arch=('any')
url="https://pypi.python.org/pypi/img2pdf"
license=('LGPL3')
depends=('python' 'python-pillow')
makedepends=('python-setuptools')
conflicts=("$pkgname-git")
provides=("python-img2pdf=${pkgver}")
replaces=('python-img2pdf')
source=("https://pypi.python.org/packages/7e/a2/4f06081f674920be757d894b4bab874e6a3b5227e730cb7618430b366e69/$pkgname-$pkgver.tar.gz")
md5sums=('bc8fca44a80af45e90f72d6b9003f5e1')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	msg "Starting setup.py..."

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
