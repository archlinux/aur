# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

pkgname=ruby-thread_safe
pkgver=0.3.5
pkgrel=1
pkgdesc="Thread-safe collections and utilities for Ruby"
arch=(any)
url="https://github.com/ruby-concurrency/thread_safe"
license=('APACHE')
depends=('ruby')
source=("http://gems.rubyforge.org/gems/thread_safe-${pkgver}.gem")
noextract=("thread_safe-${pkgver}.gem")
sha256sums=('993da065f98b8575c537ebf984ffb79eecdb6064559a3b9d2a9d7aaf313704c3')

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "thread_safe-${pkgver}.gem"
}
