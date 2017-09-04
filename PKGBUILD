
# Maintainer: Morten Linderud <morten@linderud.pw> 
# Contributor: mmm
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Stefan Husmann <stefan-husmannt-online.de>

pkgname=protege
pkgver=5.2.0
pkgrel=2
pkgdesc='Free, open source ontology editor and knowledge-base framework'
arch=('any')
url='http://protege.stanford.edu/'
license=('MPL')
depends=('java-runtime' 'graphviz')
source=("https://github.com/protegeproject/protege-distribution/releases/download/v${pkgver}/Protege-${pkgver}-linux.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums=('855dd3c26f360dab437430aaa0d1942fe8d4a53e65c83af1ee96f0f1c5dbe05b'
            '9b0a6692d04da727ba9473399c1fdf68a85c5ec680582f79b3e46642c8cceca6'
            'e0e054d864fafdee0c7a7a034b4a92fe2fe30fcce77f2aabd71afb57dbbbb0ab'
            '3ee61d8cfcbcfc91c86c9dddc24e40f9fc0e6943bf879548340610c95d64d194')

package() {
  cd "Protege-$pkgver"

  install -d "${pkgdir}/usr/share/java/${pkgname}"
  cp -r * "${pkgdir}/usr/share/java/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -D "${srcdir}/protege.sh ${pkgdir}/usr/bin/protege"
  install -Dm644 "${srcdir}/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "${srcdir}/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
