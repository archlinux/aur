# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=buildstuff
pkgver=1.0
pkgrel=1
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
            '8db3fcc4ac6d7d4238b921c4a28b1802426868be58111006340d101718c15a98'
            '72307901efa866bdedf86c00dde6578cf5ce16ec801880f562d5fa57a82ad0d6'
            'f2a62503c4b30c539e3b87d1b486000793d1ebbdbb490377b104fb01b6f24c38')
