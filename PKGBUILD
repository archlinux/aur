# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
_base=oneshot
pkgname=${_base}-bin
pkgver=2.1.1
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

sha512sums_x86_64=('09ff08223566de618e0031fda92e704959490482528ed8d98f646830b78e525cf5c0e1d6c14f36f6092f69fed0273d434afb90ed514b3bf167a15f053d20bc96')
sha512sums_armv7h=('d4163ab14ea6b21e4afffbd8111d6fb085a5ae2680705a947851113034e20190665adb21cd24a31c60fb6c34f4d97ea64fca7a002d899eb6e0a12caddac28c43')
sha512sums_aarch64=('0cc7f33402cc8c6805635d795e54ea8c226712b3ae643c4d22b4d1ebd388b643aeb55a4b2a6fc3d1d400132d35de782216c26600dd3a97c4b5e73eff5f5c9369')

package() {
  cd "${srcdir}"
  install -Dvm755 "${_base}" -t "${pkgdir}/usr/bin"
  # install -Dvm644 "${_base}.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
