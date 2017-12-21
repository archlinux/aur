# Maintainer: George Macon <george dot macon at gmail dot com>
_name=tarsnapper
pkgname=${_name}
pkgver=0.4.0
pkgrel=1
pkgdesc="Manages tarsnap backups"
arch=(any)
url="https://github.com/miracle2k/tarsnapper"
license=('BSD')
depends=("python-argparse>=1.1"
         "python-yaml>=3.09"
         "python-dateutil>=2.4.0"
         "python-pexpect>=3.1")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=(49668986a47317943fd6ff109b32809c)

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
