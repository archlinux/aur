# Maintainer: Naglis Jonaitis <naglis@mailbox.org>

pkgname=thorium-bin
pkgver=1.7.0
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
  c1d637a8b59522ca16e53c9553c67f0c549b05132cf6a311130a3593d5629747205347360fc6373009741d12eb39e7ff22f5fc48fb28399d38c79724e6cba4d9
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
