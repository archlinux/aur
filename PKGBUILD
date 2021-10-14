# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=rspec-expectations
pkgname=ruby27-${_gemname}
pkgver=3.10.1
pkgrel=1
pkgdesc='Provides a readable API to express expected outcomes of a code example'
url='https://github.com/rspec/rspec-expectations'
arch=('any')
license=('MIT')
depends=('ruby27-rspec-support' 'ruby27-diff-lcs')
options=('!emptydirs')
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha512sums=('c2e6fa12f5531ba91f03e22de3af4eed5cea74434634503302e38732b042423c669d2ddae3750d94f5f36c85433ae5743fcc0d0c4a0c50326050efde087b8a0a')

package() {
  local _gemdir="$(ruby-2.7 -e'puts Gem.default_dir')"
  gem-2.7 install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
