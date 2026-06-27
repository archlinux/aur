# Maintainer: cap153 <1536989047@qq.com>

pkgname=lanclaw-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A LANChat-compatible intelligent bot powered by Pi coding agent. "
arch=("x86_64")
url="https://github.com/cap153/LANClaw"
license=('MIT')
depends=('glibc' 'openssl' 'gcc-libs')
optdepends_x86_64=('lanchat-bin: A cross-platform LAN chat software that supports file transfer.'
	'pi: Provides Pi coding agent runtime'
	'pi-bin: Pre-compiled binary for Pi coding agent')
source=("https://github.com/cap153/LANClaw/releases/download/v0.1.0/lanclaw"
	"lanclaw.service")
sha256sums=('SKIP' 'SKIP')
options=('!strip')

package() {
	install -Dm755 "$srcdir/lanclaw" "$pkgdir/usr/bin/lanclaw"
	install -Dm644 "$srcdir/lanclaw.service" "$pkgdir/usr/lib/systemd/user/lanclaw.service"
}
# makepkg --printsrcinfo > .SRCINFO
