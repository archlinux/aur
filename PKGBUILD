# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=java-asm
pkgver=5.0.3
pkgrel=1
pkgdesc="An all purpose Java bytecode manipulation and analysis framework"
arch=('any')
url="http://asm.ow2.org/"
license=('BSD')
depends=('java-runtime')
source=(http://download.forge.objectweb.org/asm/asm-${pkgver}-bin.zip LICENSE)

package() {
	mkdir -p $pkgdir/usr/share/{java/asm,licenses/$pkgname}

	cd $srcdir

    install -m 644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname

	cd asm-${pkgver}/lib

    for i in *.jar; do
    	install -m 644 ${i} ${pkgdir}/usr/share/java/asm
		_tmpfilename=${i##*\/}
		ln -sf ${_tmpfilename} ${pkgdir}/usr/share/java/asm/${_tmpfilename/-[0-9]\.[0-9]\.[0-9]/}
    done
}

md5sums=('82636e8a1b8eec18ee20e9b71a16441a'
         'de1a27d7c9e101090ae065f8fc643a0b')
sha256sums=('e50c38c908e4aacedecf49f405937069ce6411bef9806b9a4fc9d335d6bdb36f'
            'daa45cc0832746afadb8778c1155bb5ba9079da624803a4a6bc3429ea52e7523')
