# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Greg Sutcliffe <facter_aur (at) emeraldreverie.orgr>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Thomas S Hatch <thatch45 (at) Gmail.com>
# Contributor: Dave Simons <miouhpi (at) Gmail (dot) com>
# Contributor: Niels Abspoel <aboe76 (at) Gmail (dot) com>

pkgname=facter2
pkgver=2.5.1
pkgrel=1
pkgdesc="Collect and display system facts"
arch=('any')
url="http://puppetlabs.com/facter"
license=('APACHE')
depends=('ruby' 'inetutils' 'net-tools')
makedepends=('python-docutils')
conflicts=('facter')
source=(http://downloads.puppetlabs.com/facter/facter-$pkgver.tar.gz)
b2sums=('0bdeb878540fd5bb504b8f7b4764f38d8c4720449640ada708ec2ba61b79a08e8e34e94a0a1d7166ac2c9f5ffd3d86d7eec3761be0691cbc1776a1505c971d91')

package() {
  cd facter-$pkgver

  ruby install.rb --destdir="$pkgdir" --sitelibdir="$( ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]' )"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/facter/LICENSE
}
