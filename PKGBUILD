# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Matt Harrison <matt@mistbyte.com>

_pkgname=ruby-haste
pkgname=ruby-haste
pkgver=0.2.1
pkgrel=1
pkgdesc='Simple client for uploading text to a haste-server (hastebin)'
url='https://github.com/seejohnrun/haste-client'
license=('MIT')
source=("https://rubygems.org/downloads/haste-${pkgver}.gem")
sha256sums=('d6c9d35d152d57532e5b9c32a58debad2c4bac8549f100efc1224e37ccd7b6f3')
arch=('any')
depends=('ruby' 'ruby-faraday-0.8' 'ruby-json')

package() {
  cd "${srcdir}"

  # Install the program.
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}$(ruby -e 'puts Gem.default_dir')" \
    -n "${pkgdir}/usr/bin" \
    "haste-${pkgver}.gem"
}

# vim: ft=sh ts=2 sw=2 et
