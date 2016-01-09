# Maintainer: Janne Heß <jannehess@gmail.com>

# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=decrypt-initcpio
pkgver=1.0.0
pkgrel=1
pkgdesc='A hook to unlock LUKS-encrypted devices at boot. With keyfiles.'
url='https://github.com/dasJ/decrypt-initcpio'
license=('GPL3')
depends=('mkinitcpio' 'cryptsetup')
source=("https://github.com/dasJ/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('98b957ff5f289f06e76ccce559410dce23f8a24e170c6f4b4fbd5b5a2df0a663fe96a4016f06cdaebe39d21d2186293c63b323c19909303dd4692d1e9ac657f2')
arch=("any")
backup=("etc/initcpio/decrypt")

package() {
	mkdir -p "${pkgdir}/etc/initcpio"
	mkdir -p "${pkgdir}/usr/lib/initcpio/hooks"
	mkdir -p "${pkgdir}/usr/lib/initcpio/install"

	cp "${srcdir}/${pkgname}-${pkgver}/config" "${pkgdir}/etc/initcpio/decrypt"
	cp "${srcdir}/${pkgname}-${pkgver}/hook" "${pkgdir}/usr/lib/initcpio/hooks/decrypt"
	cp "${srcdir}/${pkgname}-${pkgver}/install" "${pkgdir}/usr/lib/initcpio/install/decrypt"
}
