# Maintainer: Grey Christoforo <grey@christoforo.net>
# Contributer: Thiago Yukio Kikuchi Oliveira <stratust@gmail.com>
# Contributer:  Decrypted Epsilon <decrypted.epsilon (at) gmail (dot) com>

pkgname=bowtie2
pkgver=2.2.6
pkgrel=4
pkgdesc="Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequence."
arch=("any")
url="http://bowtie-bio.sourceforge.net/bowtie2"
license=('GPL3')
source=("https://github.com/BenLangmead/${pkgname}/archive/v${pkgver}.tar.gz")


build() {
   cd $srcdir/$pkgname-$pkgver
   make clean
   make
}

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" install
   install -d ${pkgdir}/usr/share/doc/${pkgname}
   install -Dm644 doc/* ${pkgdir}/usr/share/doc/${pkgname}
   install -Dm644 MANUAL "${pkgdir}/usr/share/doc/${pkgname}/MANUAL"
   install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('9e5d10dff2424177e8051092ff502bb6')
