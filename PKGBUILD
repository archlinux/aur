# Maintainer: DeaDDooMER <deaddoomer@deadsoftware.ru>
pkgname=gpcp-jvm
pkgver=1.3.16
pkgrel=1
pkgdesc="Gardens Point Component Pascal"
url="https://gpcp.codeplex.com"
arch=('any')
license=('BSD')
depends=('java-runtime')
source=("http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=gpcp&DownloadId=603357&FileTime=130028569339630000&Build=21028"
		"cpint" "cprun" "j2cps")
md5sums=('103bc7fe7e1811e5e5dd024c21e584bd'
			'd2c81dd1fb8316f5bd1580b9f907d485'
			'b9272c464b32e495176782a9ee42186f'
			'7a58e43aaa5a8bb7d9fa6d14f044eea0')

build() {
	rm -r ${srcdir}/gpcp-JVM-v${pkgver}/gpcp-JVM/bin
}

package() {
  cd ${srcdir}/gpcp-JVM-v${pkgver}
  
  install -d $pkgdir/usr/share/java/gpcp-JVM
  cp -R gpcp-JVM $pkgdir/usr/share/java/
  chmod -R 755 $pkgdir/usr/share/java/gpcp-JVM

  install -Dm755 $srcdir/cpint $pkgdir/usr/bin/cpint
  install -Dm755 $srcdir/cprun $pkgdir/usr/bin/cprun
  install -Dm755 $srcdir/j2cps $pkgdir/usr/bin/j2cps
}
