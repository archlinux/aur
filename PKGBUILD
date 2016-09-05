# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=buildstuff
pkgver=0.9
pkgrel=3
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

sha1sums=('9065a73d67c5c021ae9d0624b973ca93053ee1dc'
          '6ecd04bec1630ddd9ceb947e330b9624c3fa8d64'
          'ea5ca0b94ec8f2d2ba8f8c5d7f60ffc3942fcf40'
          'b30c0e4ba2c5628b210593d5e2d348ce1c84c6f1'
          '39d491e77bb573ef17d3a41dc149735c2c107b6c')
