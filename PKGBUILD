# Maintainer: Philipp A. <flying-sheep@web.de>
_name=requests_download
pkgname=python-$_name
pkgver=0.1.2
pkgrel=2
pkgdesc='Download to a local file using requests'
arch=('any')
url="https://github.com/takluyver/$_name"
license=('MIT')
depends=(python python-requests)
makedepends=('python-pip')
_wheel="$_name-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
sha256sums=('994d9d332befae6616f562769bab163f08d6404dc7e28fb7bfed4a0a43a754ad')
noextract=("$_wheel")

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
