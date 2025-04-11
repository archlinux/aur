# Maintainer: dringsim <dringsim@qq.com>

pkgname=python-biliarchiver
_name="${pkgname#python-}"
pkgver=0.1.20
pkgrel=1
pkgdesc="Archiving tool for Bilibili based on bilix"
arch=(any)
url="https://github.com/saveweb/biliarchiver"
license=('AGPL-3.0-or-later')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python-bilix' 'python-internetarchive' 'python-danmakuc' 'python-browser-cookie3'
	'python-click' 'python-click-option-group')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b686be765de5c9575b795c8ad13f6718a967bbc6bcd69525cff1b6d6855b7122')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

