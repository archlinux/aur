# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=fastq_screen
pkgver=0.11.1
pkgrel=1
pkgdesc="A screening application for high througput sequence data"
arch=('i686' 'x86_64')
url=http://www.bioinformatics.babraham.ac.uk/projects/download.html#"${pkgname//_/}"
license=('GPL3')
depends=('')
provides=('fastq_screen')
conflicts=('fastq_screen')
source=(http://www.bioinformatics.babraham.ac.uk/projects/"${pkgname}"/"${pkgname}"_v"${pkgver}".tar.gz)
md5sums=('814d13dc44208e98d2053a691556e245')

package() {
  mkdir -p "${pkgdir}"/usr/bin/
  mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"_v$"{pkgver}"/

  cd "$srcdir"/"${pkgname}"_v"${pkgver}"

  cp "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"

  install -D -m644 license.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"_v"${pkgver}"/license.txt
  install -D -m644 RELEASE_NOTES.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"_v"${pkgver}"/RELEASE_NOTES.txt
  install -D -m644 README.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"_v"${pkgver}"/README.txt
}
