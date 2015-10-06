# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Jochen Schalanda <jochen+aur AT schalanda.aname>
# Contributor: McNoggins <gagnon88 AT gmail DOT com>
pkgname=travis-yaml
pkgver=0.2.0
pkgrel=1
pkgdesc='Tool that parses, normalizes, validates and serializes your .travis.yml.'
arch=(any)
url='https://github.com/travis-ci/travis-yaml'
license=("MIT")
depends=('ruby')
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('8e710a4b0bf83d7ddf0a94c07e8ec0e52c07bdd188a286cf29098f3282f9014e')

package() {
  cd "${srcdir}"
    local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -n "${pkgdir}/usr/bin" \
      -i "${pkgdir}${_gemdir}" ${pkgname}-${pkgver}.gem
}
