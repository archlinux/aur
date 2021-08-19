# Maintainer: Marinus Enzinger <marinus at enzingerm dot de>
pkgname=snapborg
pkgver=0.1.0
pkgrel=1
pkgdesc='Automated backups of snapper snapshots to borg repositories. Inspired by borgmatic'
arch=('any')
license=('GPL3')
url='https://github.com/enzingerm/snapborg.git'
depends=('borg' 'snapper' 'python' 'python-yaml')
optdepends=()
makedepends=('python-setuptools')
backup=(etc/snapborg.yaml)
source=(git+https://github.com/enzingerm/${pkgname}.git#branch=master)
sha256sums=('SKIP')

build() {
    cd "${pkgname}"
    python setup.py build
}

package() {
    cd "${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

