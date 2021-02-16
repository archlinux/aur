# Maintainer: Naglis Jonaitis <naglis@mailbox.org>

pkgname=thorium-bin
pkgver=1.6.0
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
  ac1a60fe6153f5efbaba9a84742688fa4f6ed35b727721c6a1d07e41a166193c6bc0848ecf50a43c7be401a2a563d0a67a43e57b2957f978046074772e692c7a
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
