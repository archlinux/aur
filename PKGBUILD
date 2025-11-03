# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Daniel Maurice Davis <daniel.maurice.davis@gmail.com>

pkgname="alpine-make-rootfs"
pkgver=0.7.2
pkgrel=1
pkgdesc="Make customized Alpine Linux rootfs (base image) for containers"
arch=('any')
url="https://github.com/alpinelinux/${pkgname}"
license=('MIT')
depends=(
  'sh'
  'wget'
)
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a9a562f4bdcb2e2eb50cb7b1b83e48a458b613f412f128b27afb06b75735604f')

package() {
  cd "${srcdir}/${_pkgsrc}"
  make PREFIX='/usr' DESTDIR="${pkgdir}" install

  install -vDm644 "README.adoc" "${pkgdir}/usr/share/doc/${pkgname}/README.adoc"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
