# Maintainer: Ischa Abraham <contact@ischa.dev>
pkgname=passh-agent-bin
pkgver=0.2.0
pkgrel=2
pkgdesc="An ssh-agent implementation to fetch your SSH keys from Pass."
url="https://github.com/MrPixelized/passh-agent"
license=("GPL3")
arch=("x86_64")
provides=("passh-agent")
options=("strip")
source=("https://github.com/MrPixelized/passh-agent/releases/download/v$pkgver/passh-agent-$pkgver-x86_64.tar.gz")
sha256sums=("6dee33d74bd26b67482f68502b0fcf1a20aad624771f45de292b9b17e10e1b83")

package() {
	cd "$srcdir/passh-agent-$pkgver-x86_64"
    install -Dm755 passh-agent -t "$pkgdir/usr/bin/"
	install -Dm644 passh-agent.service -t "$pkgdir/usr/lib/systemd/user/"
}
