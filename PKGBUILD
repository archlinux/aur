# Maintainer: Klimenko Maxim Sergievich <klimenkomaximsergievich@gmail.com>
# Contributor: Klimenko Maxim Sergievich <klimenkomaximsergievich@gmail.com>

pkgname=simple-stateful-firewall-git
pkgver=0.0.34
pkgrel=1
pkgdesc="Simple Stateful Firewall. For personal computers or you can change this by yourself"
arch=('i686' 'x86_64')
url="https://github.com/asciiscry3r/simple-stateful-firewall"
license=('GPL2')
depends=('iptables')
optdepends=('opensnitch: A GNU/Linux application firewall')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/asciiscry3r/simple-stateful-firewall/archive/refs/tags/${pkgver}.tar.gz")
sha1sums=('SKIP')
conflicts=('simple-stateful-firewall-git' 'simple-stateful-firewall')
provides=('simple-stateful-firewall-git')
install="simplestatefulfirewall.install"

package() {
    echo "Fakeroot directory is ${pkgdir}/"
    cd "simple-stateful-firewall-${pkgver}" || exit 1
    make DESTDIR="${pkgdir}/" install
}
