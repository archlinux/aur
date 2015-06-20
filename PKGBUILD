# Maintainer: Thiago Yukio Kikuchi Oliveira <stratust@gmail.com>
# Contributer:  Decrypted Epsilon <decrypted.epsilon (at) gmail (dot) com>

pkgname=bowtie2
pkgver=2.2.5
_pkgver=$pkgver
pkgrel=1
pkgdesc="Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequence."
arch=("x86_64")
url="http://bowtie-bio.sourceforge.net/bowtie2"
license=('GPL3')
source=(http://downloads.sourceforge.net/project/bowtie-bio/bowtie2/$_pkgver/$pkgname-$_pkgver-source.zip)
sha512sums=('8b97860fea73ef36a60dee3dbccdfc956ac7f619ec47a7b820d1df09cff8f77362ddc8071b59ea8021444bda59757d68bdf486fb453d5c4e4b896198bc465d60')

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
