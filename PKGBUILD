# Maintainor: Franklyn Tackitt <franklyn+aur@tackitt.net>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail.com>

_pkgname=phantomjs
_pkgver=1.9.8
pkgname=${_pkgname}-bin-${_pkgver}
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Headless WebKit with JavaScript API (official static binary)"
url="http://www.phantomjs.org/"
license=("BSD")
arch=('x86_64' 'i686')
depends=('fontconfig')
conflicts=('phantomjs')
provides=('phantomjs')
options=('!strip')
source=("https://bitbucket.org/ariya/phantomjs/downloads/${_pkgname}-${_pkgver}-linux-${CARCH}.tar.bz2")
[[ "$CARCH" == "x86_64" ]] && md5sums=('4ea7aa79e45fbc487a63ef4788a18ef7')
[[ "$CARCH" == "i686" ]] && md5sums=('814a438ca515c6f7b1b2259d0d5bc804')

package() {
  install -Dm755 "$srcdir/${_pkgname}-${pkgver}-linux-${CARCH}/bin/phantomjs" "$pkgdir/usr/bin/phantomjs"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}-linux-${CARCH}/LICENSE.BSD" "$pkgdir/usr/share/licenses/phantomjs-bin/LICENSE.BSD"
}
