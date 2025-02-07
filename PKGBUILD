# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-bin
pkgver=2025.1.4
pkgrel=1
pkgdesc="A secure and free password manager for all of your devices."
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'libnotify'
  'libsecret'
  'org.freedesktop.secrets'
  'libxtst'
  'libxss'
  'libnss_nis'
  'nss'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/bitwarden/clients/releases/download/desktop-v$pkgver/Bitwarden-$pkgver-amd64.deb")
sha512sums=('5f64aa8f36688705e7299d8d3399c80f6815a8e1133a39ec6e4b09ee908d78949e8d8a5ef09e38d6e824ae1d4356871ac3e0b997093186033ad604c1b63aca99')

package() {
	bsdtar xf data.tar.xz -C "$pkgdir"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/Bitwarden/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
