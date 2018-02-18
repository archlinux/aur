# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=letsencrypt-cli
pkgver=0.6.0
pkgrel=1
pkgdesc="Yet another Letsencrypt (ACME) client using Ruby."
url="https://github.com/zealot128/ruby-letsencrypt-cli"
arch=('any')
license=('MIT')
depends=("ruby-colorize" "ruby-acme-client" "ruby-thor")
source=("https://github.com/zealot128/ruby-letsencrypt-cli/archive/v${pkgver}.tar.gz")
md5sums=('c4e68818bc4449b4fe70aaf23af309d7')
 
package() {
    cd "${srcdir}/ruby-$pkgname-$pkgver/"
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" letsencrypt-cli
}
