# Submitter: Jochen Schalanda <jochen+aur AT schalanda.aname>
# Maintainer: McNoggins <gagnon88 AT gmail DOT com>
pkgname=travis-lint
pkgver=2.0.0
pkgrel=1
pkgdesc='travis-lint is a tool that check your .travis.yml for possible issues, deprecations and so on.'
arch=(any)
url='https://github.com/travis-ci/travis-lint'
license=("MIT")
depends=('ruby')
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('1918261232d278d6c371ab3ace1d43a13408af799ed62fcb62bd866654c2eaea')

package() {
  cd "${srcdir}"
    local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -n "${pkgdir}/usr/bin" \
      -i "${pkgdir}${_gemdir}" ${pkgname}-${pkgver}.gem
}