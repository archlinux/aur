# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=hiera
pkgver=2.0.0
pkgrel=1
pkgdesc="Lightweight pluggable hierarchical database"
arch=('any')
url="http://projects.puppetlabs.com/projects/hiera"
license=('APACHE')
depends=('ruby')
backup=('etc/hiera.yaml')
source=($pkgname-$pkgver.tar.gz::http://github.com/puppetlabs/$pkgname/archive/$pkgver.tar.gz)
md5sums=('fa6dbd53553fd6143ab0b8fcb1ce442d')

package() {
  cd $pkgname-$pkgver

  ruby install.rb --destdir="$pkgdir" --sitelibdir="$( ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]' )" --mandir=/

  install -d "$pkgdir"/var/lib/hiera/

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
