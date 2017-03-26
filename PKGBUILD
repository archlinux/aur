# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=buildstuff
pkgver=0.9
pkgrel=4
pkgdesc='Stuff to build packages in virtual machines'
url='http://arch.vesath.org/'
arch=('any')
license=('custom:ISC')
depends=('qemu-headless' 'openssh' 'e2fsprogs' 'parted'
         'arch-install-scripts')
source=('README'
        'LICENSE'
        'proxy.cgi'
        'arch.build'
        'arch.install')

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/bin"
	install arch.* "${pkgdir}/usr/bin"
	install -d "${pkgdir}/var/lib/buildstuff"
	install -Dm644 README "${pkgdir}/usr/share/${pkgname}/README"
	install -Dm755 proxy.cgi "${pkgdir}/usr/share/${pkgname}/proxy.cgi"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('386c1300cf5ce851a7532d8ee903c077193f61e2c01007c7991283b887228faf'
            'acf683446e1162104759b1a75d18859b1a36ac6f3eeabb241025d0e6c37c7960'
            '8e55607c0948d8219fa7063f9df4fbb2c432275694253848a5fc1240275d7e36'
            '85da3d942596be0b69c5595b4edf8f6b46cd9185f55597db8cf370f5c401e410'
            '59e100c1140a109c8a98feb6ac5dc86e3830d2964ead74e820651b504b5829d4')
