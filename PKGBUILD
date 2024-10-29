# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-bin
pkgver=2024.10.2
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
sha512sums=('101caa53e5a2bd50a9ade0d60a4e3b1a420c1d41891028115b8ffead5a8911f6e34f549231eeec6f522a61014f97556640384913587bc522435cfa7570f18aa0')

package() {
	bsdtar xf data.tar.xz -C "$pkgdir"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/Bitwarden/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
