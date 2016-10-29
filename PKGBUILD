pkgname=('mcu-info-util-git')
pkgver=0.4
pkgrel=1
pkgdesc='Utility which can find toolchain and compiler flags for specified MCU and generated linker script and header file if needed'
arch=('any')
url='https://github.com/KivApple/mcu-info-util'
license=('MIT')
depends=('python' 'cmsis-svd-git')
makedepends=('python-setuptools')
optdepends=('avr-gcc: AVR toolchain'
            'avr-libc: AVR libc'
            'arm-none-eabi-gcc: ARM toolchain')
source=('mcu-info-util::git+https://github.com/KivApple/mcu-info-util')
md5sums=('SKIP')

package() {
    cd mcu-info-util
    python setup.py bdist
    cd $pkgdir
    tar -xzvf $srcdir/mcu-info-util/dist/mcu-info-util-*.tar.gz
}
