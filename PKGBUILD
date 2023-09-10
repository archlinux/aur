pkgname=acme-cli
pkgver=2.0.0
pkgrel=1
pkgdesc="Yet another Letsencrypt (ACME) client using Ruby."
url="https://github.com/zealot128/ruby-acme-cli"
arch=('any')
license=('MIT')
depends=("ruby-colorize" "ruby-acme-client" "ruby-thor")
source=("https://github.com/zealot128/ruby-acme-cli/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('5fd65e2247a46bb7ed9f8944439546db')
 
package() {
    cd "${srcdir}/ruby-acme-cli-$pkgver/"
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" letsencrypt-cli
}
