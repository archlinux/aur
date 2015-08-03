# Maintainer: Grey Christoforo <grey@christoforo.net>
# Contributer: Thiago Yukio Kikuchi Oliveira <stratust@gmail.com>
# Contributer:  Decrypted Epsilon <decrypted.epsilon (at) gmail (dot) com>

pkgname=bowtie2
pkgver=2.2.6
pkgrel=2
pkgdesc="Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequence."
arch=("any")
url="http://bowtie-bio.sourceforge.net/bowtie2"
license=('GPL3')
source=("https://github.com/BenLangmead/bowtie2/releases/download/v$pkgver/$pkgname-$pkgver-source.zip")
#source=(http://downloads.sourceforge.net/project/bowtie-bio/bowtie2/$pkgver/$pkgname-$pkgver-source.zip)
sha512sums=('3ab5a5475cf214affd91e0d1782fd2d6dedccd979e3c809b5dfb272726d99ff1c7b59d92e387b187a7c2e43557786a1085186ccb96588de91212caf2eb94ce4f')

build() {
		cd $srcdir/$pkgname-$pkgver
		make clean
		make
}

package() {
		cd "${srcdir}/${pkgname}-${pkgver}"
		make DESTDIR="${pkgdir}" install
		install -Dm644 doc/* ${pkgdir}/usr/share/doc/${pkgname}
		install -Dm644 MANUAL "${pkgdir}/usr/share/doc/${pkgname}/MANUAL"
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
