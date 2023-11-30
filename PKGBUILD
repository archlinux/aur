# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Javier Tia <javier.tia@gmail.com>

# otfinfo --info *.otf

_pkgname='Office-Code-Pro'
_commit='d8fe9b1655a449d5fa4952d8388a626bfd87d652'
pkgname="${_pkgname,,}"
pkgver=1.004+1
pkgrel=1
pkgdesc='Customized version of Source Code Pro font'
arch=('any')
url="https://github.com/phooky/${_pkgname}"
license=('custom: SIL Open Font License 1.1')
source=("${_pkgname}::git+${url}#commit=${_commit}")
makedepends=(git)
sha256sums=(SKIP)

package() {
  cd "${_pkgname}"
  find 'Fonts' -type f -name "*.otf" -exec install -Dvm644 "{}" -t "${pkgdir}/usr/share/fonts/OTF" \;
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
