# Maintainer: Marinus Enzinger <marinus at enzingerm dot de>

pkgname=snapborg
pkgver=0.1.1
pkgrel=1
pkgdesc='Automated backups of snapper snapshots to borg repositories, inspired by borgmatic'
arch=('any')
url='https://github.com/enzingerm/snapborg'
license=('GPL3')
depends=('borg' 'snapper' 'python' 'python-yaml')
makedepends=(git python-setuptools)
provides=(snapborg)
backup=(etc/snapborg.yaml)
source=(git+https://github.com/enzingerm/snapborg.git#tag=v0.1.1)
sha256sums=('SKIP')

build() {
    cd "${srcdir}/snapborg"
    python setup.py build
}

package() {
    cd "${srcdir}/snapborg"
    python setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}"
}

