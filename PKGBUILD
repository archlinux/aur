# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=letsencrypt-cli
pkgver=0.4.1
pkgrel=1
pkgdesc="Yet another Letsencrypt (ACME) client using Ruby."
url="https://github.com/zealot128/ruby-letsencrypt-cli"
arch=('any')
license=('MIT')
depends=("ruby-colorize" "ruby-acme-client" "ruby-thor")
source=("https://github.com/zealot128/ruby-letsencrypt-cli/archive/v${pkgver}.tar.gz")
md5sums=('3d83b01e48669a03d792844e3c3846e3')
 
package() {
    cd "${srcdir}/ruby-$pkgname-$pkgver/"
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" letsencrypt-cli
}
