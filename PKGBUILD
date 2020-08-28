# Maintainer: Naglis Jonaitis <naglis@mailbox.org>

pkgname=thorium-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A cross platform desktop reading app, based on the Readium Desktop toolkit"
arch=('x86_64')
license=('BSD')
url="https://github.com/edrlab/thorium-reader"
depends=('libnotify' 'nss' 'libxss' 'xdg-utils' 'libappindicator-gtk3' 'libsecret')
_filename=EDRLab.ThoriumReader_${pkgver}_amd64.deb
source=(
  ${url}/releases/download/v${pkgver}/${_filename}
  ${url}/raw/v${pkgver}/LICENSE
)
sha512sums=(
  c3f7e9b7efccb35da4302a0ab8932d0ce77b2e2e8bebb7e1a910923def62deb193435603c0899505f8fc4c0437f085b0ecb24e3aea52451172c341b4d587fc2d
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
