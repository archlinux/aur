# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit
pkgver=0.0.6
pkgrel=1
pkgdesc='A tool for scanning Python environments for known vulnerabilities'
arch=('any')
url='https://github.com/trailofbits/pip-audit'
license=('Apache')
depends=('python-pip-api' 'python-packaging' 'python-dataclasses' 'python-progress' 'python-resolvelib' 'python-html5lib' 'python-cachecontrol' 'python-lockfile' 'python-cyclonedx-lib')
makedepends=('python-setuptools')
conflicts=('python-pip-audit-git')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trailofbits/pip-audit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('24d84f9cf29d2fa6e7bb4fadeb7a568c9507cfe41861c6e3fbe7dc8b374aa607568da917f718217820368beb9b3b884be28b0376240e2fc5ac3f79e4d33d8cb8')

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
