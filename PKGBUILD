
# Maintainer: Morten Linderud <morten@linderud.pw> 
# Contributor: mmm
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Stefan Husmann <stefan-husmannt-online.de>

pkgname=protege
pkgver=5.0.0
pkgrel=1
pkgdesc='Free, open source ontology editor and knowledge-base framework'
arch=('any')
url='http://protege.stanford.edu/'
license=('MPL')
depends=('java-runtime' 'graphviz')

source=("https://github.com/protegeproject/protege-distribution/releases/download/protege-${pkgver}/Protege-${pkgver}-linux.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.png")

sha256sums=('dfc42ade196d96749bc9f9c61aa169a6dbdf49b8e54d31a12d5a1bdba66b13f1'
            'd8b673954300b73c1badd85283489a5791ae8cdb3cd266fdc5753898b47926a5'
            'e0e054d864fafdee0c7a7a034b4a92fe2fe30fcce77f2aabd71afb57dbbbb0ab'
            '3ee61d8cfcbcfc91c86c9dddc24e40f9fc0e6943bf879548340610c95d64d194')

package() {
  cd Protege-$pkgver

  install -d ${pkgdir}/usr/share/java/${pkgname}
  cp -r * ${pkgdir}/usr/share/java/${pkgname}
  install -d ${pkgdir}/usr/bin
  install -D ${srcdir}/protege.sh ${pkgdir}/usr/bin/protege
  install -Dm644 "${srcdir}/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "${srcdir}/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
