# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-pip-audit
pkgver=0.0.5
pkgrel=1
pkgdesc='A tool for scanning Python environments for known vulnerabilities'
arch=('any')
url='https://github.com/trailofbits/pip-audit'
license=('Apache')
depends=('python-pip-api' 'python-packaging' 'python-dataclasses' 'python-progress' 'python-resolvelib' 'python-html5lib' 'python-cachecontrol' 'python-lockfile')
makedepends=('python-setuptools')
conflicts=('python-pip-audit-git')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trailofbits/pip-audit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('018aa04901baee74399314faa3afeebd141be91d4bba7621f5c657281458ae5a7d90db60e3059d9bfec858dc0e4251b9c56321b8d22d2533edf9db1154180a03')

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
