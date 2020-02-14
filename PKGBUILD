# Maintainer: Mikael Blomstrand <mikael ÅT mbloms DÖT se>
# Contributor: Jendrik Wenke <jendrikwenke+aur at gmail dot com>

pkgname=scala-dotty
_reltag=0.23.0-RC1
pkgver=${_reltag//-/}
pkgrel=1
pkgdesc='Research compiler that will become Scala 3'
arch=('any')
url='http://dotty.epfl.ch'
license=('BSD')
depends=('java-environment>=8' 'java-environment<=11')
source=("https://github.com/lampepfl/dotty/releases/download/${_reltag}/dotty-${_reltag}.tar.gz")
sha1sums=('cb2fb4c44b2ba3d0e4f72b66240904cc29f4d837')
sha256sums=('60eb531eb6240735028a8bb035e9520173327c54386e44a97eb0a28b056fc430')
sha512sums=('11e4c68978b325617d55a5609689af2d7e2aacce909b56c2fea3378d028365490fd5bb6a65f9df561b353f05d101ca997f6c96af8378a54de8bfc95dbe117be0')

package() {
       install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/scala-dotty/bin"
       cp -r "${srcdir}/dotty-${_reltag}/lib" "${pkgdir}/usr/share/scala-dotty"
       install -m755 "${srcdir}/dotty-${_reltag}/bin/"* "${pkgdir}/usr/share/scala-dotty/bin"
       ln -s "../share/scala-dotty/bin/dotc" "${pkgdir}/usr/bin/dotc"
       ln -s "../share/scala-dotty/bin/dotd" "${pkgdir}/usr/bin/dotd"
       ln -s "../share/scala-dotty/bin/dotr" "${pkgdir}/usr/bin/dotr"
}
