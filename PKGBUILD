pkgname=ttf-dotsies
pkgver=1.0
pkgrel=9
pkgdesc="Dotsies is a font that uses dots instead of letters. Dotsies is optimized for reading. The letters in each word smoosh together, so words look like shapes."
arch=('any')
url="http://dotsies.org/"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontscale' 'xorg-mkfontdir')
install=ttf-dotsies.install
source=("http://dotsies.org/Dotsies.ttf"
	"http://dotsies.org/Dotsies%20Training%20Wheels.ttf"
	"http://dotsies.org/Dotsies%20Wide.ttf"
	"http://dotsies.org/Dotsies%20Context.ttf"
	"http://dotsies.org/Dotsies%20Striped.ttf"
	"http://dotsies.org/Dotsies%20Roman.ttf"
	"21-dotsies.conf")
md5sums=('c747d6f74958bc94460d1ff5a08d4584'
         '10412f34d8d7bfb8feb46c2f13233e61'
         '542d9c7a221821fbb9ed6b4526bb681e'
         '3f4e47182a011a999fea23a800c4920a'
         '457c56bef89d7a245cab89834c91f652'
         'cf6fd2aefa299c0ae15b310f0cefef54'
         'a5ee21dde968e45ea7bf7a74b192d391')
build() {
	mv ${srcdir}/Dotsies%20Training%20Wheels.ttf ${srcdir}/Dotsies\ Training\ Wheels.ttf
	mv ${srcdir}/Dotsies%20Wide.ttf ${srcdir}/Dotsies\ Wide.ttf
	mv ${srcdir}/Dotsies%20Context.ttf ${srcdir}/Dotsies\ Context.ttf
	mv ${srcdir}/Dotsies%20Striped.ttf ${srcdir}/Dotsies\ Striped.ttf
	mv ${srcdir}/Dotsies%20Roman.ttf ${srcdir}/Dotsies\ Roman.ttf
}

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF
  install -dm755 "${pkgdir}"/etc/fonts/conf.avail

  install -m644 ${srcdir}/Dotsies.ttf "${pkgdir}"/usr/share/fonts/TTF/
  install -m644 ${srcdir}/Dotsies\ Training\ Wheels.ttf "${pkgdir}"/usr/share/fonts/TTF/
  install -m644 ${srcdir}/Dotsies\ Wide.ttf "${pkgdir}"/usr/share/fonts/TTF/
  install -m644 ${srcdir}/Dotsies\ Context.ttf "${pkgdir}"/usr/share/fonts/TTF/
  install -m644 ${srcdir}/Dotsies\ Striped.ttf "${pkgdir}"/usr/share/fonts/TTF/
  install -m644 ${srcdir}/Dotsies\ Roman.ttf "${pkgdir}"/usr/share/fonts/TTF/
  install -m644 ${srcdir}/21-dotsies.conf "${pkgdir}"/etc/fonts/conf.avail/
}
