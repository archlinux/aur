# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-bin
pkgver=2025.1.1
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
sha512sums=('ae85d71b84535196988b2a60918b04e5db0e1512c5405729664251534a3c44c34a7bb81a24548436fe78b3197bae50487fd50cf290e8da2016388f8fb0b125cc')

package() {
	bsdtar xf data.tar.xz -C "$pkgdir"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/Bitwarden/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
