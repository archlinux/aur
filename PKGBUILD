# $Id$
# Maintainer: Tjahneee <t3e@protonmail.com>

pkgname=tic-80
pkgver=0.60.3
pkgrel=1
pkgdesc='TIC-80 tiny computer emulator'
arch=('i686' 'x86_64')
url="https://tic.computer/"
license=('MIT')

source=("https://github.com/nesbox/TIC-80/archive/v$pkgver.tar.gz"
        "https://github.com/tjahneee/3rd-party/archive/v0.60.3-libs.tar.gz")

sha256sums=('53890e47a1433797f2faa70330bd22c8495404581fd1eb325fd7bcc9b52dbf2d'
            'e8714115d450eb27357707a673c486cffade26faf3367eb5e513fde3d28e6734')

package() {
    mv 3rd-party-$pkgver-libs 3rd-party
	cd TIC-80-$pkgver/
	make linux
	install -Dm755 bin/tic80 "${pkgdir}/usr/bin/tic80"
}
