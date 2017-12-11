# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: carlf <carlf at photocarl dot org>
# Contributor: oslik <oslik at mail dot ru>
#
# namcap warns that dependency ruby-rack is an unnecessary dependency. This is
# untrue.

pkgname=adsf
pkgver=1.4.0
pkgrel=1
pkgdesc='A web server that you can launch instantly in any directory.'
arch=(any)
url='https://github.com/ddfreyne/adsf'
license=(MIT)
depends=('ruby-rack<3')
makedepends=(rubygems)
provides=(ruby-adsf)
conflicts=(ruby-adsf)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${pkgname}-${pkgver}.gem"
        "https://github.com/ddfreyne/adsf/blob/${pkgver}/LICENSE")
noextract=("${pkgname}-${pkgver}.gem")
sha256sums=('b29d3a71877d56b4c5cfe4d856e4aa4d4f6989d545ddb6cdfecc5950223dd51a'
            '538b506f7ebc8adb1164766a5ede083eda6bb16459c51575723e35df36581a44')

package() {
  HOME=/tmp gem install \
    --no-user-install \
    --ignore-dependencies \
    --install-dir "${pkgdir}$(ruby -rubygems -e 'puts Gem.default_dir')" \
    --bindir "${pkgdir}/usr/bin" \
    "${srcdir}/${pkgname}-${pkgver}.gem"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
