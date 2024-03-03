# Maintainer: Noa <coolreader18@gmail.com>
pkgname=celeste64-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A game made in under 2 weeks for Celeste's 6th Anniversary (official bin)"
arch=(x86_64)
url="https://maddymakesgamesinc.itch.io/celeste64"
license=('custom:celeste64')
options=('!strip')
provides=(celeste64)
conflicts=(celeste64)
_archive_file="Celeste64-v$pkgver-Linux-x64.zip"
source=("https://github.com/ExOK/Celeste64/releases/download/v$pkgver/$_archive_file"
        "celeste64.desktop")
noextract=("$_archive_file")
sha256sums=('56720256950cdeba9bb6eef9bdd3abdb85362c1ab949b8b183ad88c5db416cad'
            '9906284626f846e34c55807a60126b2bf034697adab5ef15c2665e18f5abd795')

package() {
	mkdir -p "$pkgdir"/opt/celeste64
	bsdtar -xC "$pkgdir"/opt/celeste64 -f "$_archive_file"
	install -Dm 644 celeste64.desktop -t "$pkgdir"/usr/share/applications
}
