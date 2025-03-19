# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='amdcovc'
pkgver='0.4.1.2'
pkgrel='1'
pkgdesc='Control AMD Overdrive settings with or without X'
arch=('x86_64')
url="https://github.com/matszpk/${pkgname}"
depends=('ocl-icd' 'pciutils')
makedepends=('opencl-headers')
license=('GPL')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('0eade87f70a51c4e059aa664ac98c9bd0f418e9954754665df4bc3e56e8f623f')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0775 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
