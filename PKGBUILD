# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Greg Sutcliffe <facter_aur (at) emeraldreverie.orgr>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Thomas S Hatch <thatch45 (at) Gmail.com>
# Contributor: Dave Simons <miouhpi (at) Gmail (dot) com>
# Contributor: Niels Abspoel <aboe76 (at) Gmail (dot) com>

pkgname=facter2
pkgver=2.4.6
pkgrel=2
pkgdesc="Collect and display system facts"
arch=('any')
url="http://puppetlabs.com/facter"
license=('APACHE')
depends=('ruby' 'inetutils' 'net-tools')
makedepends=('python-docutils')
provides=('facter')
conflicts=('facter')
source=(http://downloads.puppetlabs.com/facter/facter-$pkgver.tar.gz)
md5sums=('43fee9f5cc63abe9bb057586c744303b')

package() {
  cd facter-$pkgver

  ruby install.rb --destdir="$pkgdir" --sitelibdir="$( ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]' )"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/facter/LICENSE
}
