# Maintainer: Grey Christoforo <grey@christoforo.net>
# Contributer: Thiago Yukio Kikuchi Oliveira <stratust@gmail.com>
# Contributer:  Decrypted Epsilon <decrypted.epsilon (at) gmail (dot) com>

pkgname=bowtie2
pkgver=2.2.6
_pkgver=$pkgver
pkgrel=1
pkgdesc="Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequence."
arch=("x86_64")
url="http://bowtie-bio.sourceforge.net/bowtie2"
license=('GPL3')
source=(bowtie2-2.2.6-source.zip::https://github.com/BenLangmead/bowtie2/blob/master/latest_release/bowtie2-2.2.6-source.zip?raw=true)
#source=(http://downloads.sourceforge.net/project/bowtie-bio/bowtie2/$_pkgver/$pkgname-$_pkgver-source.zip)
sha512sums=('3ab5a5475cf214affd91e0d1782fd2d6dedccd979e3c809b5dfb272726d99ff1c7b59d92e387b187a7c2e43557786a1085186ccb96588de91212caf2eb94ce4f')

build() {
		cd $srcdir/$pkgname-$_pkgver
		make
}

package() {
		cd "${srcdir}/${pkgname}-${_pkgver}"
		install -d ${pkgdir}/usr/bin
		install -d ${pkgdir}/usr/share/doc/${pkgname}
		install -Dm755 bowtie2 ${pkgdir}/usr/bin
		install -Dm755 bowtie2-align-l ${pkgdir}/usr/bin
		install -Dm755 bowtie2-align-s ${pkgdir}/usr/bin
		install -Dm755 bowtie2-build ${pkgdir}/usr/bin
		install -Dm755 bowtie2-build-l ${pkgdir}/usr/bin
		install -Dm755 bowtie2-build-s ${pkgdir}/usr/bin
		install -Dm755 bowtie2-inspect ${pkgdir}/usr/bin
		install -Dm755 bowtie2-inspect-l ${pkgdir}/usr/bin
		install -Dm755 bowtie2-inspect-s ${pkgdir}/usr/bin
		install -Dm644 doc/* ${pkgdir}/usr/share/doc/${pkgname}
		install -Dm644 MANUAL "${pkgdir}/usr/share/doc/${pkgname}/MANUAL"
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
