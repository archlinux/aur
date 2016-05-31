# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=letsencrypt-cli
pkgver=0.3.0
pkgrel=1
pkgdesc="Yet another Letsencrypt (ACME) client using Ruby."
url="https://github.com/zealot128/ruby-letsencrypt-cli"
arch=('any')
license=('MIT')
depends=("ruby-colorize" "ruby-acme-client" "ruby-thor")
source=("https://github.com/zealot128/ruby-letsencrypt-cli/archive/v${pkgver}.tar.gz")
md5sums=('513cceaeb6ea6e1053d865ee6f64773d')
 
package() {
    cd "${srcdir}/ruby-$pkgname-$pkgver/"
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" letsencrypt-cli
}
