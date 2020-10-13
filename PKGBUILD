# Maintainer: Naglis Jonaitis <naglis@mailbox.org>

pkgname=thorium-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A cross platform desktop reading app, based on the Readium Desktop toolkit"
arch=('x86_64')
license=('BSD3')
url="https://github.com/edrlab/thorium-reader"
depends=('libnotify' 'nss' 'libxss' 'xdg-utils' 'libappindicator-gtk3' 'libsecret')
_filename=EDRLab.ThoriumReader_${pkgver}_amd64.deb
source=(
  ${url}/releases/download/v${pkgver}/${_filename}
  ${url}/raw/v${pkgver}/LICENSE
)
sha512sums=(
  dd156f37d735fe7ed257218f309572d2b358f8b0e967bcd2f6871125118476a2b0cb2f9a8b84a98b355c535958cb670a052bab47fdcf3c81e9b1f4e056286613
  SKIP
)

package() {
    tar xJf ${srcdir}/data.tar.xz -C ${pkgdir}/

	# Symlink
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/Thorium/thorium" "${pkgdir}/usr/bin/thorium"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
