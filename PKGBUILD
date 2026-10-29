# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="puncia"
pkgver=0.42
pkgrel=2
pkgdesc="The Panthera(P.)uncia of Cybersecurity - Subdomain & Exploit Hunter powered by AI"
url="https://pypi.org/project/puncia/"
license=("custom:none")
arch=("any")
depends=("python" "python-requests")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('4164e587585850eb5e16b67c858e0b7cb5f2ca9b71cfe74f91e6f06dd795369b94e5329fa26680886f253aa6bded9bdcb186756f6b2b5b7b69d5c85597ef4d3d')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
