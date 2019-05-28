# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: carlf <carlf at photocarl dot org>
# Contributor: oslik <oslik at mail dot ru>
#
# namcap warns that dependency ruby-rack is an unnecessary dependency. This is
# untrue.

pkgname=adsf
pkgver=1.4.2
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
sha256sums=('ebf3a8af1facd577ec90cd2000ec5d5b53dffc710420a0308002f7d49e392b17'
            'ca73e8ea87495579f44f1f6550b3c7953babf8b6b5c32fe891ecb8817175f460')

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
