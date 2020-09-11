# Maintainer: Mikael Blomstrand <mikael ÅT mbloms DÖT se>
# Contributor: Jendrik Wenke <jendrikwenke+aur at gmail dot com>

pkgname=scala-dotty
_reltag=0.27.0-RC1
pkgver=${_reltag//-/}
pkgrel=1
pkgdesc='Research compiler that will become Scala 3'
arch=('any')
url='http://dotty.epfl.ch'
license=('BSD')
depends=('java-environment>=8' 'java-environment<=11')
source=("https://github.com/lampepfl/dotty/releases/download/${_reltag}/dotty-${_reltag}.tar.gz")
sha1sums=('c7b08e2d8a9473e2fba929992c44c390e5a88793')
sha256sums=('f8dac1ff8b67e479f77a54d6581e24861cf284244f87e7a76a358abe24886eb1')
sha512sums=('498fac83c3788016d840c16e3a0ad5fa7f121c3a1ea8572a81663a88e432937fea97f3d45a56055df20a77ccf3d33588674ffbfed2654b6b534cf658bd0ddfb6')

package() {
       install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/scala-dotty/bin"
       cp -r "${srcdir}/dotty-${_reltag}/lib" "${pkgdir}/usr/share/scala-dotty"
       install -m755 "${srcdir}/dotty-${_reltag}/bin/"* "${pkgdir}/usr/share/scala-dotty/bin"
       ln -s "../share/scala-dotty/bin/dotc" "${pkgdir}/usr/bin/dotc"
       ln -s "../share/scala-dotty/bin/dotd" "${pkgdir}/usr/bin/dotd"
       ln -s "../share/scala-dotty/bin/dotr" "${pkgdir}/usr/bin/dotr"
}
