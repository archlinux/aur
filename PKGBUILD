# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
_base=oneshot
pkgname=${_base}-bin
pkgver=2.0.2
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

sha512sums_x86_64=('9c4769c6c9a3ffb2013bdb00b4f9f5b130eaffd24f118b468b5b0e85665b7ee4ead1bc0d2ac3df5256a9ab29aaf100a9b0981c655b986609be533fe2c8e3d4e6')
sha512sums_armv7h=('be5039bb155071748522afb707e22721f614b6a5fe287a9f36eddcfcd19c16db5e883b28104bbe4ad5ec2e798e5e40e24ec90d18eb0b87e1e82b5b4df94eff23')
sha512sums_aarch64=('5294aa32eee7958277a732e97df88a0232b466fdf58acd143b421ea34bfe992e537ef4e307fdbe220025bd19908365761efca789502dc412148329c326643103')

package() {
  cd "${srcdir}"
  install -Dvm755 "${_base}" -t "${pkgdir}/usr/bin"
  # install -Dvm644 "${_base}.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
