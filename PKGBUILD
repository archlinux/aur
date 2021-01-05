# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: carlf <carlf at photocarl dot org>
# Contributor: oslik <oslik at mail dot ru>
#
# namcap warns that dependency ruby-rack is an unnecessary dependency. This is
# untrue.

pkgname=adsf
pkgver=1.4.5
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
sha256sums=('5a4deacac06e28f942c10e77700223d164355620a60f89c9692d7cd1f397a6f0'
            '958fe11f7a6d2e5815b99a4e66913a45b30fbaee6241460481f0bea170062c0d')

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
