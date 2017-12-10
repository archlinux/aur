# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=ruby-azure-signature
pkgver=0.2.3
pkgrel=2
pkgdesc="The azure-signature library generates storage signatures for Microsoft Azure's cloud platform"
arch=(any)
url="http://github.com/ManageIQ/azure-signature"
license=('Apache 2.0')
depends=('ruby' 'ruby-addressable')
makedepends=('rubygems')
optdepends=('test-unit')
source=(https://rubygems.org/downloads/${pkgname#ruby-}-$pkgver.gem)
noextract=(${pkgname#ruby-}-$pkgver.gem)
sha512sums=('d48d48f09165981afccdcc02620c1ee9ffc8342cbfa929bb32b8e902a169ff35063818f77ebfd94d15fbeb7f8ba79c9d53823519eef89da1a9a35069d2db1933')

package() {
  cd "$srcdir"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" -n "$pkgdir/usr/bin" "${pkgname#ruby-}-$pkgver.gem"
}
