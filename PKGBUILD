# Maintainer: TC <crt@archlinux.email>
_pkgname=profanity-omemo-plugin
pkgname=$_pkgname-git
pkgver=0.1.1.44.ge9dc156
pkgrel=1
pkgdesc="A Python plugin to use (axolotl / Signal Protocol) encryption for the profanity XMPP messenger"
arch=('any')
url="https://github.com/ReneVolution/profanity-omemo-plugin"
license=('GPL3')
depends=('python2-cryptography')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=profanity-omemo-plugin.install
options=('emptydirs')
source=("$_pkgname::git+https://github.com/ReneVolution/profanity-omemo-plugin.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's|-|.|g'
}

package() {
  cd "$srcdir/$_pkgname"

  # run install script
  ./install.sh --install_path ${pkgdir}

  # install license
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
}
