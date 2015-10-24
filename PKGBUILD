# Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	Jussi Timperi	<gmail.com: jussi.timperi>

pkgname=suomi-malaga-voikko
pkgver=1.19
pkgrel=1
pkgdesc="A description of Finnish morphology written in Malaga."
arch=('any')
url="http://voikko.sourceforge.net/"
license=('GPL2')
makedepends=('python2' 'malaga>=7.12')
source=("http://www.puimula.org/voikko-sources/suomi-malaga/suomi-malaga-${pkgver}.tar.gz")
md5sums=('1ab59f4c6aacf31170a19f9cb8beab6a')

build() {
  cd "${srcdir}/suomi-malaga-${pkgver}"

  make voikko PYTHON="python2" EXTRA_LEX=vocabulary/erikoisalat/linux-distributions.lex
}

package() {
  cd "${srcdir}/suomi-malaga-${pkgver}"

  make voikko-install DESTDIR="${pkgdir}/usr/lib/voikko"

}
