# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: carlf <carlf at photocarl dot org>
# Contributor: oslik <oslik at mail dot ru>
#
# namcap warns that dependency ruby-rack is an unnecessary dependency. This is
# untrue.

pkgname=adsf
pkgver=1.4.4
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
sha256sums=('c23818b3f4ceeb392f989ada882a6246a7a6bd72788f125930eecd355e52053e'
            'cdcd6c9372f064be186866588ef8b4863641c486d4686aae5f4fc83a86ec5fd1')

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
