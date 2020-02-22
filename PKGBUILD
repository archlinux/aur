# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='amdcovc'
pkgver='0.4.1.1'
pkgrel='1'
pkgdesc='Control AMD Overdrive settings with or without X.'
arch=('x86_64')
url="https://github.com/matszpk/${pkgname}"
depends=('ocl-icd' 'pciutils')
makedepends=('opencl-headers')
license=('GPL')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('a9025ff3709ad62755b55877b153c78b0d55a9bf7eb3ef94e936966cd255d5df')

prepare() {
  cd "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm775 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
