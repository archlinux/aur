# Maintainer: Mikael Blomstrand <mikael ÅT mbloms DÖT se>
# Contributor: Jendrik Wenke <jendrikwenke+aur at gmail dot com>

pkgname=scala-dotty
_reltag=0.26.0-RC1
pkgver=${_reltag//-/}
pkgrel=1
pkgdesc='Research compiler that will become Scala 3'
arch=('any')
url='http://dotty.epfl.ch'
license=('BSD')
depends=('java-environment>=8' 'java-environment<=11')
source=("https://github.com/lampepfl/dotty/releases/download/${_reltag}/dotty-${_reltag}.tar.gz")
sha1sums=('d157933f8510b43d591037981295bebe8840f88f')
sha256sums=('ce98dfacec906a2c22ca4060d819e10500428cc79eccc04b2ff84c0a5cf2d29a')
sha512sums=('2e82f57509a5fd78bbfc63acd41366e4d08a150a69bb7157da21136808fa3e4def5e194fe13f51b0f1e9fc697f4091caa66360fa0eb5b35e58e8d714eb8745df')

package() {
       install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/scala-dotty/bin"
       cp -r "${srcdir}/dotty-${_reltag}/lib" "${pkgdir}/usr/share/scala-dotty"
       install -m755 "${srcdir}/dotty-${_reltag}/bin/"* "${pkgdir}/usr/share/scala-dotty/bin"
       ln -s "../share/scala-dotty/bin/dotc" "${pkgdir}/usr/bin/dotc"
       ln -s "../share/scala-dotty/bin/dotd" "${pkgdir}/usr/bin/dotd"
       ln -s "../share/scala-dotty/bin/dotr" "${pkgdir}/usr/bin/dotr"
}
