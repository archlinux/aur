# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Matt Harrison <matt@mistbyte.com>

_pkgname=ruby-haste
pkgname=ruby-haste
pkgver=0.3.0
pkgrel=1
pkgdesc='Simple client for uploading text to a haste-server (hastebin)'
url='https://github.com/seejohnrun/haste-client'
license=('MIT')
source=("https://rubygems.org/downloads/haste-${pkgver}.gem")
sha256sums=('102c7727eebfde6fe15a65ebb69247e60f0936843777a84541e25ef4af1b9f84')
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
