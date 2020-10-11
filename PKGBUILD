# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs-vault-bin
pkgver=2.16.1
pkgrel=1
pkgdesc="Integrates the Vault Web-Interface into bitwarden_rs. Pre-compiled binaries from https://github.com/dani-garcia/bw_web_builds."
arch=('any')
url="https://github.com/bitwarden/web"
license=('AGPL3')
depends=('bitwarden_rs')
conflicts=("bitwarden_rs-vault" "bitwarden_rs-vault-git") 
provides=('bitwarden_rs-vault')
install=bitwarden_rs-vault.install
source=("https://github.com/dani-garcia/bw_web_builds/releases/download/v$pkgver/bw_web_v$pkgver.tar.gz"
	"https://github.com/dani-garcia/bw_web_builds/releases/download/v$pkgver/bw_web_v$pkgver.tar.gz.asc"
	"${pkgname%-bin}.install")
sha512sums=('418963fbac141e7866cab4c3e3e641c36a6fbabcc69f14514be0f097a3965f90b057e1c9624fc70a28e42335dc0130dd616f697ce7a4c58da6ccd8da3bc64ad3'
            'SKIP'
            '0b93ea1a442f15ac2445bc0cb759887b0826215edbc73dabb150de8ac136c8712c18b798ff397a06d50989332562a36382b5b7d962e60c2f2619d0f46cf9b04d')
validpgpkeys=('B9B7A108373276BF3C0406F9FC8A7D14C3CD543A')

package() {
	# install vault files
	install -d "$pkgdir/usr/share/bitwarden_rs"
	cp -r "$srcdir/web-vault" "$pkgdir/usr/share/bitwarden_rs/vault"
}
