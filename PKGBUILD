# Maintainer: André Klitzing <aklitzing () gmail () com>

pkgname=persosim_driver
pkgver=20180209
pkgrel=1
pkgdesc='Der Open Source Simulator für den elektronischen Personalausweis'
arch=('i686' 'x86_64')
url='http://www.persosim.de'
license=('GPL3')
depends=('pcsclite' 'pcsc-tools')
source=("https://persosim.secunet.com/fileadmin/user_upload/PersoSim_Driver_PCSCLite_$pkgver.tgz" Makefile.patch)

prepare()
{
	cd "de.persosim.driver.pcsclite"
	patch -p0 -i $srcdir/Makefile.patch
}

build()
{
	cd "de.persosim.driver.pcsclite"
	make
}

package()
{
	cd "de.persosim.driver.pcsclite"
	make PREFIX="$pkgdir" install
}

sha256sums=('8207d4fc0c79b1c806d784b5eabca8e174142d7f0f4a400f50e7c9819e2cbfe2'
            'fda323876719c3347ae182ecfbb0aaab43dbb5d12ece0b89017e14674f0a2b32')
