# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=img2pdf
pkgver=0.2.1
pkgrel=1
pkgdesc="Losslessly convert images to PDF without unnecessarily increasing file size by re-encoding JPEG files."
arch=('any')
url="https://pypi.python.org/pypi/img2pdf"
license=('LGPL3')
depends=('python-pillow')
makedepends=('git' 'python-setuptools')
conflicts=("$pkgname-git" "python-$pkgname")
source=("https://pypi.python.org/packages/8b/fa/a69becbc9b2f1c5eff52ae1dc4d7394de239729be252e8ff6a50a21c0a4d/$pkgname-$pkgver.tar.gz")
md5sums=('19c187ba34a8762be8b044612d4cd19d')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	msg "Starting setup.py..."

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
