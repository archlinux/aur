# Maintainer: Quentin Bouvet <qbouvet at outlook dot com>
pkgname=undistract-me
pkgver=0.1.1
pkgrel=1
pkgdesc="Notifies you when long-running terminal commands complete | Now with bash-preexec support"
arch=('any')
url="https://github.com/qbouvet/undistract-me"
license=('expat')

#makedepends=('')
depends=('bash-preexec' 'libnotify' 'xorg-xprop')
provides=('undistract-me')
conflicts=('undistract-me')

source=("${pkgname}-${pkgver}::https://github.com/qbouvet/undistract-me/archive/v${pkgver}.tar.gz")
sha256sums=('1179cfff6509b49158b7b0825ad0dfff1978137053d709363923ae1a3f30ecf1')
install=${pkgname}.install

#build() {
#    
#}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m0755 -t "${pkgdir}/usr/share/${pkgname}" \
    "long-running.bash" \
    "undistract-me.sh" \
    "preexec.bash"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
