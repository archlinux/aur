# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=buildstuff
pkgver=0.8
pkgrel=1
pkgdesc='Stuff to build packages in virtual machines'
url='http://arch.vesath.org/'
arch=('any')
license=('ISC')
depends=('qemu' 'openssh' 'e2fsprogs' 'jfsutils')

source=('arch.build'
        'arch.install'
        'cirrus.conf'
        'fstab'
        'pacman.conf'
        'proxy.cgi'
        'sudoers.d'
        'syslinux.cfg'
        'LICENSE'
        'README')

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/var/lib/${pkgname}"
	install -Dm755 arch.build "${pkgdir}/usr/bin/arch.build"
	install -Dm755 arch.install "${pkgdir}/usr/bin/arch.install"
	install -Dm755 proxy.cgi "${pkgdir}/usr/share/${pkgname}/proxy.cgi"
	install -Dm644 pacman.conf "${pkgdir}/usr/share/${pkgname}/pacman.conf"
	install -Dm644 fstab "${pkgdir}/usr/share/${pkgname}/guest/etc/fstab"
	install -Dm644 sudoers.d "${pkgdir}/usr/share/${pkgname}/guest/etc/sudoers.d/user"
	install -Dm644 cirrus.conf "${pkgdir}/usr/share/${pkgname}/guest/etc/modprobe.d/cirrus.conf"
	install -Dm644 syslinux.cfg "${pkgdir}/usr/share/${pkgname}/guest/boot/syslinux/syslinux.cfg"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

sha1sums=('fb8d7856d925bd92f1e9ba84d1a75ea43e107844'
          '0a0a12473122c73c2a536c9a77d46cfd9e5a1424'
          '315fc0847eaf46e74a92b4c62c0cd3ef73d1e89a'
          'e7e2949822a35d2e70f826e3e942f40c5c6f41bb'
          '2b709786e16586baf28278292472e58dea10da5f'
          'ef7077f9e61da1eb53a3ba5ea096daf8d733cba7'
          '7d19d155ab1887ac1f84e682cbec54078c63758d'
          'c3ea9e9250bba2fbfa591fc85065e0dabe4b8e46'
          '352a7d6d53c2945f8fbbfff47d4f1dccc8d33829'
          'b0071da8f3dd319be0b8c637349c949ae5e71291')
