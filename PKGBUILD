# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=hiera
pkgver=3.2.2
pkgrel=2
pkgdesc="Lightweight pluggable hierarchical database"
arch=('any')
url="http://projects.puppetlabs.com/projects/hiera"
license=('APACHE')
depends=('ruby')
backup=('etc/hiera.yaml')
source=(https://downloads.puppetlabs.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('6c1e6039ca934af326e5ebe4cb5e49c8')

package() {
  cd $pkgname-$pkgver

  ruby install.rb --destdir="$pkgdir" --sitelibdir="$( ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]' )" --mandir=/

  install -d "$pkgdir"/var/lib/hiera/

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
