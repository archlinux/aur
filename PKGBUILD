# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>

pkgname=hiera
pkgver=1.3.4
pkgrel=1
pkgdesc="Lightweight pluggable hierarchical database"
arch=('any')
url="http://projects.puppetlabs.com/projects/hiera"
license=('APACHE')
depends=('ruby')
backup=('etc/hiera.yaml')
source=($pkgname-$pkgver.tar.gz::http://github.com/puppetlabs/$pkgname/archive/$pkgver.tar.gz)
md5sums=('db2c60ceefd5817fbc8c7816b524e629')

package() {
  cd "$srcdir"/$pkgname-$pkgver

  ruby install.rb --destdir="$pkgdir"/ --sitelibdir="$( ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]' )" --mandir=/

  install -d "$pkgdir"/var/lib/hiera/

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
