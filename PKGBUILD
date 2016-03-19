# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=letsencrypt-cli
pkgver=0.2.0
pkgrel=2
pkgdesc="Yet another Letsencrypt (ACME) client using Ruby."
url="https://github.com/zealot128/ruby-letsencrypt-cli"
arch=('any')
license=('MIT')
depends=("ruby" "ruby-acme-client")
source=("https://github.com/zealot128/ruby-letsencrypt-cli/archive/v${pkgver}.tar.gz")
md5sums=('67625b8efa3e73980448f4600f7577ac')
 
package() {
    cd "${srcdir}/ruby-$pkgname-$pkgver/"
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" letsencrypt-cli
}
