# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='amdcovc'
pkgver='0.3.9.2'
pkgrel='1'
pkgdesc='Control AMD Overdrive settings with or without X.'
arch=('x86_64')
url="https://github.com/matszpk/${pkgname}"
depends=('ocl-icd' 'pciutils')
license=('GPL')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('a3b4e21f342b4529301f80c3b22880576e3b85d22f4dd98be4c56b3618c49077')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm775 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
