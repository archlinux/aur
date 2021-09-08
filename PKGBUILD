# Maintainer: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>

pkgname=nrfutil
pkgver=6.1.2
pkgrel=1
pkgdesc="nrfutil command line utility and the nordicsemi library"
arch=('any')
url="https://github.com/NordicSemiconductor/pc-nrfutil"
license=('BSD')
depends=('python')
makedepends=('python-pip')
options=(!emptydirs)
source=()


package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir"/usr/lib/nrfutil-bundle --ignore-installed nrfutil==$pkgver
	install -dm0755 "$pkgdir"/usr/bin
	echo "#!/bin/bash
PYTHONPATH=/usr/lib/nrfutil-bundle/usr/lib/python3.8/site-packages/ exec /usr/lib/nrfutil-bundle/usr/bin/nrfutil \$*" >"$pkgdir"/usr/bin/nrfutil
	chmod a+x "$pkgdir"/usr/bin/nrfutil
}
