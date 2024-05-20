# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
_base=oneshot
pkgname=${_base}-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="First-come-first-serve single-fire HTTP/HTTPS server"
url="https://github.com/raphaelreyna/${_base}"
arch=(x86_64 armv7h aarch64)
license=(MIT)
conflicts=("${_base}")
provides=("${_base}")
source_x86_64=("${_base}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_base}_Linux_x86_64.tar.gz")
source_armv7h=("${_base}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_base}_Linux_armv7.tar.gz")
source_aarch64=("${_base}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_base}_Linux_arm64.tar.gz")

sha512sums_x86_64=('98e5cd29d92ccc3a9cac112899763ff9d61abe75325809b1f4f692713e51b66ce7f5068c6b7cff446b08c56fa6c7615eff2f762ac04194ca6e24b7090d527e86')
sha512sums_armv7h=('f7e8e12fa2723fbf95a456abc8e48623feda4be994cf3af0a1391ee7a7bd6c39afd7ff9c8b7e7265b6c0704092f7d063bc6d93d79401f6c790b26411abb93d50')
sha512sums_aarch64=('d97856c6ec30cee438f35617fd92bb49579383d54f6dc4545a36bc5ddc46759f031fbf7e29b6ae5465308fa2dd1ed540401520575d1b04599a7b8d86cbb1f53a')

package() {
  cd "${srcdir}"
  install -Dvm755 "${_base}" -t "${pkgdir}/usr/bin"
  # install -Dvm644 "${_base}.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
