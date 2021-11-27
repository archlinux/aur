# Maintainer: Raymond Li <aur@raymond.li>

pkgname=jflap2tikz
pkgver=1.2
pkgrel=2
pkgdesc='Convert JFlap file into a LATEX file depicting the automaton using TikZ'
arch=('any')
url="https://www.ctan.org/pkg/jflap2tikz?lang=en"
license=('custom')
depends=('groovy')
source=("http://mirrors.ctan.org/graphics/${pkgname}.zip"
		"LICENSE"
	   "jflap2tikz.sh")
sha256sums=('625264995030491208857f370715e328b03b388f16d60e4c381c1df3519da141'
            '362a0f90a53c27370b7685c940082ba7941f487a7aeb87aab8882a1094db7e3a'
            'dd5cf8ffd83daf560fe1399ce27bcffbc02b14e810f5f0935b40b17cd27c1449')

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 jflap2tikz.sh "${pkgdir}/usr/bin/jflap2tikz"

  cd "$pkgname"
  install -D "$pkgname".groovy "$pkgdir"/usr/lib/"$pkgname"/"$pkgname".groovy
  install -d "$pkgdir"/usr/share/doc/"$pkgname"
  cp -r examples "$pkgdir"/usr/share/doc/"$pkgname"/examples
  install CHANGES "$pkgdir"/usr/share/doc/"$pkgname"/CHANGES
  install README "$pkgdir"/usr/share/doc/"$pkgname"/README
  install JFLAP2TikZ.pdf "$pkgdir"/usr/share/doc/"$pkgname"/JFLAP2TikZ.pdf
  install JFLAP2TikZ.tex "$pkgdir"/usr/share/doc/"$pkgname"/JFLAP2TikZ.tex
}
