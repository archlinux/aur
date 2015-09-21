# Original Maintainer: James Duley <jagduley gmail>
pkgname=gcc-arm-none-eabi-bin
pkgver=4.9_2015_q2_update
_pkgname=gcc-arm-none-eabi
_pkgver=${pkgver//_/-}
_pkgvershort=${_pkgver%-*}
_pkgvershort=${_pkgvershort/-q/q}
_pkgdate=20150609
pkgrel=1
pkgdesc="GNU Tools ARM Embedded Processors (binary distribution, includes GDB and newlib)"
arch=('i686' 'x86_64')
if [ "${CARCH}" = "x86_64" ]; then
    depends=('lib32-ncurses' 'lib32-glibc')
else
    depends=('ncurses' 'glibc')
fi
provides=('gcc-arm-none-eabi'
	  'arm-none-eabi-gcc'
	  'arm-none-eabi-gdb'
	  'arm-none-eabi-binutils'
	  'arm-none-eabi-newlib'
    )
conflicts=('gcc-arm-none-eabi'
	  'arm-none-eabi-gcc'
	  'arm-none-eabi-gdb'
	  'arm-none-eabi-binutils'
	  'arm-none-eabi-newlib'
    )
url="https://launchpad.net/gcc-arm-embedded"
source="https://launchpad.net/gcc-arm-embedded/${pkgver%%_*}/${_pkgver}/+download/${_pkgname}-${_pkgvershort/./_}-${_pkgdate}-linux.tar.bz2"
license=('custom')
options=(!strip staticlibs)
sha256sums=('3a574c5becfca496bafe07bbd76e9deae1fd0cc99c5a9de0f8c610750f2f89ac')

package() {
 mkdir -p $pkgdir/usr
 cd $srcdir/gcc-*
 cp -a * $pkgdir/usr
}
