# Maintainer: Mick Elliot <micke at sfu dot ca>
# Contributor: Ronny Lorenz < ronny at tbi.univie.ac.at >
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=readseq
pkgver=2.1.30
origver=2.1.27
pkgrel=2
pkgdesc="A biosequence data format conversion tool"
arch=('i686' 'x86_64')
url="http://iubio.bio.indiana.edu/soft/molbio/${pkgname}/java/"
license=('custom')
depends=('java-runtime' 'bash')
source=(  "${url}${pkgname}.jar"
          "${url}${pkgname}-help.html"
          "${url}Readseq2-help.html"
          "readseq.sh"
          "license"
          "arch-readseq.readme")

md5sums=('0b40df0f7e1283e03c09bfcf70cb381c'
         'd1a73902a66a6b210e751be9d0e8e6c6'
         '389be807c8037976b6ae06a9ebe178aa'
         '177bad15a8f79db2678850ac3718973f'
         '51fb18f9b72171d0943807fce97d3cab'
         '72f9ff0c2e17eab8883c09ec98bf0e91')

package() {
  # cd $startdir/src/
  install -D -m755 readseq.sh "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 license "${pkgdir}/usr/share/licenses/${pkgname}/license"
  install -D -m644 ${pkgname}.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -D -m644 ${pkgname}-help.html "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}-help.html"
  install -D -m644 Readseq2-help.html "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}2-help.html"
  install -D -m644 arch-readseq.readme "${pkgdir}/usr/share/doc/${pkgname}/arch-readseq.readme"
  echo "***************************************************************************"
  echo "Documentation and arch-specific instructions are in /usr/share/doc/readseq/"
  echo "***************************************************************************"
}

