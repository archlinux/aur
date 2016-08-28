# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=buildstuff
pkgver=0.9
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

sha1sums=('9065a73d67c5c021ae9d0624b973ca93053ee1dc'
          '6ecd04bec1630ddd9ceb947e330b9624c3fa8d64'
          '853f64797cdd0a57e7049f594340db20bd4e1eba'
          '6cc34d8524d2d0da74e3537f777a67f567e389e6'
          '39d491e77bb573ef17d3a41dc149735c2c107b6c')
