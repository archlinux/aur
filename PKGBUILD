# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="puncia"
pkgver=0.11
pkgrel=1
pkgdesc="The Panthera(P.)uncia of Cybersecurity - Subdomain & Exploit Hunter powered by AI"
url="https://pypi.org/project/puncia/"
license=("custom:none")
arch=("any")
depends=("python-requests")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('f8ea5bb34c2295627ce0538879e0962e600d28b392f812225eacbf71a1c4075b897125919669e673317ab2bb5b118e49b7f926d7cd4643e62743592cd3418a00')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
