# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Antony Male <antony dot male at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>

_pkgname=gist
pkgname=${_pkgname}-git
pkgver=4.3.0.r33.g8776be3
pkgrel=1
pkgdesc="Potentially the best command line gister"
arch=(any)
url="http://github.com/defunkt/gist"
license=('MIT')
depends=('ruby')
makedepends=('git')
optdepends=("xclip: will put pasted gists url into X selection automagically"
    "xsel: put pasted gist's url into X selection automagically")
provides=('gist=4.3.0')
conflicts=('gist')
source=('git://github.com/defunkt/gist.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

package() {
  cd $_pkgname

  install -Dm755 build/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 build/${_pkgname}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -Dm644 LICENSE.MIT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
