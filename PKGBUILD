# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="puncia"
pkgver=0.24
pkgrel=1
pkgdesc="The Panthera(P.)uncia of Cybersecurity - Subdomain & Exploit Hunter powered by AI"
url="https://pypi.org/project/puncia/"
license=("custom:none")
arch=("any")
depends=("python-requests")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('8dc5acfb7ca4f973d1eba0a37ee626697c0df9ac35834b739d048a1d2c59e0714e3cfc8fcd94768022be6a2f15a5032c0b38563b6ddbc1ffb08e649bb6927aba')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
