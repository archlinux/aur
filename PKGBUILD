# RubyGems PKGBUILD Generator
# Bash Booster <booster.sdk@gmail.com>

_pkgname=("rake")
pkgname=("ruby-${_pkgname}")
pkgver=12.0.0
pkgrel=1
arch=("any")
pkgdesc="Rake is a Make-like program implemented in Ruby"
url="https://github.com/ruby/rake"
license=("MIT")
makedepends=("ruby")
optdepends=("ruby-bundler" "ruby-minitest" "ruby-rdoc")
source=("https://rubygems.org/gems/rake-12.0.0.gem")
sha256sums=("f6b43059e2923ddd30128fbbf4eb2e610c020b888ad97b57d7d94abc12734806")
noextract=("${_pkgname}-${pkgver}.gem")

package() {
 local _gemdir="$(ruby -rubygems -e"puts Gem.default_dir")"
 gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "${_pkgname}-${pkgver}.gem"
}
