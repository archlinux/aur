#Maintainer: max-k <max-k AT post DOT com>
#Contributor: Jamie Nguyen <dyscoria@googlemail.com>

pkgname=flack
pkgver=2.0.6
pkgrel=2
pkgdesc="A menu-driven BASH script to edit FLAC tags"
arch=('i686' 'x86_64')
url='http://www.sourceforge.net/projects/flack/'
license=('GPL')
backup=('etc/flackrc')
depends=('bash>=3.2' 'flac>=1.2.1')
source=(http://downloads.sourceforge.net/flack/flack-${pkgver}.tar.gz)
sha1sums=('86fd01dbb312ab6f85dfc3e1297ba64a8f365aa3')

package()
{
  cd ${srcdir}/flack-${pkgver}
  # copy script
  install -D -m755 flack ${pkgdir}/usr/bin/flack || return 1
  # copy configuration file
  install -D -m644 flackrc ${pkgdir}/etc/flackrc || return 1
}

