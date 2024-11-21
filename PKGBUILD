# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-bin
pkgver=2024.11.1
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
sha512sums=('cf4cf58b1c18b53e0ed528ab425c32982e7dd8687139891bd61e99b574a69b1acc36e49a5fb7619782b8f668c452e0e5ce8072a9cf712f298e0cc140c213db51')

package() {
	bsdtar xf data.tar.xz -C "$pkgdir"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/Bitwarden/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
