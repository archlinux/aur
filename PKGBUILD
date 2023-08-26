# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
_base=oneshot
pkgname=${_base}-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="First-come-first-serve single-fire HTTP/HTTPS server"
url="https://github.com/raphaelreyna/${_base}"
arch=('x86_64' 'armv7h' 'aarch64')
license=(MIT)
conflicts=("${_base}")
provides=("${_base}")
source_x86_64=("${_base}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_base}_Linux_x86_64.tar.gz")
source_armv7h=("${_base}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_base}_Linux_armv7.tar.gz")
source_aarch64=("${_base}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_base}_Linux_arm64.tar.gz")

sha512sums_x86_64=('1241c64486ba026135e83d2a23fc4e1279a97a8d1020c17fe14f7400dba4be9137c0886871457f689e7a8f18d722121e934b27a09ccce8505d5156c29016d185')
sha512sums_armv7h=('607a4a17a68e3f76fb1ce1a48e97319139564e088c3911c5b1e307e56d7d2981f977fd50818bb13002950b264b9179530748b825d89d4d5d4a338d928d0daee6')
sha512sums_aarch64=('450357a9d3ccf3c4d92d2f73eb5a34c0bb49e16290805edef02d97c324cbc08d3479078ae8bcc3f8d500e888f29bdbb94c724da5238775d6ecb947cd3de0c2fe')

package() {
  cd "${srcdir}"
  install -Dvm755 "${_base}" -t "${pkgdir}/usr/bin"
  # install -Dvm644 "${_base}.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
