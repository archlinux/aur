# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs-vault-bin
pkgver=2.12.0e
pkgrel=1
pkgdesc="Integrates the Vault Web-Interface into bitwarden_rs. Pre-compiled binaries from https://github.com/dani-garcia/bw_web_builds."
arch=('any')
url="https://github.com/bitwarden/web"
license=('AGPL3')
depends=('bitwarden_rs')
conflicts=("bitwarden_rs-vault-git" "bitwarden_rs-vault") 
provides=('bitwarden_rs-vault')
install=bitwarden_rs-vault-bin.install
source=("https://github.com/dani-garcia/bw_web_builds/releases/download/v$pkgver/bw_web_v$pkgver.tar.gz"
	"$pkgname.install")
sha512sums=('58bce032f75055fef9d60d826201443f8585a3529eb7a2402baa45fed4d8a5d074c8e558bc7a59a0b750526c560212323798d773d4cdc44debe84cef90b13484'
            '0b93ea1a442f15ac2445bc0cb759887b0826215edbc73dabb150de8ac136c8712c18b798ff397a06d50989332562a36382b5b7d962e60c2f2619d0f46cf9b04d')

package() {
	# install vault files
	install -d "$pkgdir/usr/share/bitwarden_rs"
	cp -r "$srcdir/web-vault" "$pkgdir/usr/share/bitwarden_rs/vault"
}
