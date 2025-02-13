# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bitwarden-bin
pkgver=2025.2.0
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
sha512sums=('b2075504cfcd0751e20f37b09d167dd86440fe4f97b207608761b16bdb57c4d0362bff47a52acaea5e36cba26267a34aba1236b53605b77894d376e5bab935f8')

package() {
	bsdtar xf data.tar.xz -C "$pkgdir"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/Bitwarden/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
