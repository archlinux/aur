# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>

pkgname=hiera
pkgver=1.3.3
pkgrel=1
pkgdesc="Lightweight pluggable hierarchical database"
arch=('any')
url="http://projects.puppetlabs.com/projects/hiera"
license=('APACHE')
depends=('ruby')
source=(http://github.com/puppetlabs/$pkgname/archive/$pkgver.tar.gz)
backup=('etc/hiera.yaml')
md5sums=('1286bd7e1d8d161146430367b105319a')

package() {
  cd "$srcdir"/$pkgname-$pkgver

  ruby install.rb --destdir="$pkgdir"/ --sitelibdir="$( ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]' )" --mandir=/

  install -d "$pkgdir"/var/lib/hiera/

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
