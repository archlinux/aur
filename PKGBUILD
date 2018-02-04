# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: carlf <carlf at photocarl dot org>
# Contributor: oslik <oslik at mail dot ru>
#
# namcap warns that dependency ruby-rack is an unnecessary dependency. This is
# untrue.

pkgname=adsf
pkgver=1.4.1
pkgrel=1
pkgdesc='A web server that you can launch instantly in any directory.'
arch=(any)
url='https://github.com/ddfreyne/adsf'
license=(MIT)
depends=('ruby-rack<3')
provides=(ruby-adsf)
conflicts=(ruby-adsf)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${pkgname}-${pkgver}.gem"
        "https://github.com/ddfreyne/adsf/blob/${pkgver}/LICENSE")
noextract=("${pkgname}-${pkgver}.gem")
sha256sums=('b8d598d74a28d0103786c2f64dc927e50fcbb6c0c678af19b8162990cd6e0bbd'
            'e9b0431c295cde4e96495904c40ebad7d109272212167a1ac8fc911359cd2e6d')

package() {
  HOME=/tmp gem install \
    --no-user-install \
    --no-document \
    --ignore-dependencies \
    --install-dir "${pkgdir}/$(ruby -e 'puts Gem.default_dir')" \
    --bindir "${pkgdir}/usr/bin" \
    "${srcdir}/${pkgname}-${pkgver}.gem"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
