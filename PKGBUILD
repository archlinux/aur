# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Javier Tia <javier.tia@gmail.com>

# otfinfo --info *.otf

_pkgname='Office-Code-Pro'
pkgname="${_pkgname,,}"
pkgver=1.004
pkgrel=3
pkgdesc='Customized version of Source Code Pro font'
arch=('any')
url='https://github.com/nathco/Office-Code-Pro'
license=('custom: SIL Open Font License 1.1')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('9bca923d17f6c47a586d8e4567d46ccfa58fb8b8e2247b5ee2a19da1597c58f6')

package() {
  cd "${_pkgname}-${pkgver}"
  find 'Fonts' -type f -name "*.otf" -exec install -Dvm644 "{}" -t "${pkgdir}/usr/share/fonts/OTF" \;
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
