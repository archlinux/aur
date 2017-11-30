# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=java-asm
pkgver=6.0
pkgrel=1
pkgdesc="An all purpose Java bytecode manipulation and analysis framework"
arch=('any')
url="http://asm.ow2.org/"
license=('BSD')
depends=('java-runtime')
source=(http://download.forge.ow2.org/asm/asm-${pkgver}-bin.zip LICENSE)


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

sha256sums=('1b695514adf46be4115f1e926270fe3f0e2797d3068cd3743ba2a9930053ac62'
            '02f021ae8f8f2f205d36b20790eedd6a871dd3007ddf160c8692b6f3a3284fc7')
