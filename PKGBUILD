# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=hiera
pkgver=3.0.1
pkgrel=1
pkgdesc="Lightweight pluggable hierarchical database"
arch=('any')
url="http://projects.puppetlabs.com/projects/hiera"
license=('APACHE')
depends=('ruby')
backup=('etc/hiera.yaml')
source=(https://downloads.puppetlabs.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('a9c8884705d7f32e51ce357553487b93')

package() {
  cd $pkgname-$pkgver

  ruby install.rb --destdir="$pkgdir" --sitelibdir="$( ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]' )" --mandir=/

  install -d "$pkgdir"/var/lib/hiera/

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
