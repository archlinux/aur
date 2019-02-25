# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=hiera
pkgver=3.4.4
pkgrel=2
pkgdesc="Lightweight pluggable hierarchical database"
arch=('any')
url="https://projects.puppetlabs.com/projects/hiera"
license=('APACHE')
depends=('ruby')
backup=('etc/hiera.yaml')
source=(https://downloads.puppetlabs.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('0df0c943db0cf9c60a482258ca225c0b')

package() {
  cd $pkgname-$pkgver

  ruby install.rb --destdir="$pkgdir" --sitelibdir="$( ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]' )" --mandir=/

  install -d "$pkgdir"/var/lib/hiera/

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
