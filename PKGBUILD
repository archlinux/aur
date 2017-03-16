# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Matt Harrison <matt@mistbyte.com>

_pkgname=ruby-haste
pkgname=ruby-haste
pkgver=0.2.2
pkgrel=1
pkgdesc='Simple client for uploading text to a haste-server (hastebin)'
url='https://github.com/seejohnrun/haste-client'
license=('MIT')
source=("https://rubygems.org/downloads/haste-${pkgver}.gem")
sha256sums=('d7b3e1c86233afaed58ca4fdb74d128d4e69cfb4fe7c139358f66f8c20023f77')
arch=('any')
depends=('ruby' 'ruby-faraday' 'ruby-json')

package() {
  cd "${srcdir}"

  # Install the program.
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}$(ruby -e 'puts Gem.default_dir')" \
    -n "${pkgdir}/usr/bin" \
    "haste-${pkgver}.gem"
}

# vim: ft=sh ts=2 sw=2 et
