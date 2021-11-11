# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-cyclonedx-lib
_gitpkgname=cyclonedx-python-lib
pkgver=0.11.1
pkgrel=1
pkgdesc='Library for producing CycloneDX SBOM (Software Bill of Materials) files'
arch=('any')
url='https://github.com/CycloneDX/cyclonedx-python-lib'
license=('Apache')
depends=('python-packageurl' 'python-requirements-parser' 'python-setuptools' 'python-importlib-metadata' 'python-toml' 'python-typing-extensions')
conflicts=('python-cyclonedx-lib-git')
options=('!strip')
source=("${_gitpkgname}-${pkgver}.tar.gz::https://github.com/CycloneDX/cyclonedx-python-lib/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('cc22fc965e94868d7ff3021f3e2822aef6e5e2bf46250b379777db00d52273e2bb710102e6e2ca48206f370875ad05437959d346be12d2db6d6dcce314e1c9ff')

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
