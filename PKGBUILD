# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>
# Contributor: Eric Berquist <eric DOT berquist AT gmail DOT com>

pkgname=nwchem-data
_pkgver=7.2.3-10
pkgver="${_pkgver//-/\.}"
pkgrel=1
pkgdesc='High-performance computational chemistry software (data files)'
arch=('any')
url='https://nwchemgit.github.io'
license=('custom:ECL2.0' 'GPL3')
options=('!strip')
source=("http://httpredir.debian.org/debian/pool/main/n/nwchem/${pkgname}_${_pkgver}_all.deb")
sha256sums=('11357740241d24e66c01e59b92e69c0f2b94a3062f89801fcf745adf99e94c15')

package() {
  local tar_exclude=(--exclude '*Debian*' --exclude lintian) # exclude debian-specific files
  bsdtar -C "${pkgdir}/" "${tar_exclude[@]}" -xvf data.tar.xz

  install -Dm644 "${pkgdir}"/usr/share/doc/"${pkgname}"/copyright "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
