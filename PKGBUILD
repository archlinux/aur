# Maintainer: robertfoster

pkgname=iortcw-venom-mod
pkgver=5.5
pkgrel=1
epoch=
pkgdesc="Venom Mod is a general improvement of original Rtcw game, with a new challenging and aggressive AI and some exploitation of features of id tech 3 engine, keeping the original gameplay"
arch=(any)
url="https://www.moddb.com/mods/rtcw-venom-mod"
license=('CUSTOM')
depends=('iortcw-git')
makedepends=('unrar')
source=("http://www.wolfenstein-files.de/rtcw/single/Venom_Mod_v$pkgver.rar")
noextract=("Venom_Mod_v$pkgver.rar")
md5sums=('bc6c1f5ecd2ced42b05657dad8f873a8')

package() {
	cd "$srcdir"
	unrar -o+ e "Venom_Mod_v$pkgver.rar"
	for i in $(ls *.pk3); do
		install -Dm755 $i $pkgdir/opt/iortcw/Venom\ Mod/$i
	done
	install -Dm755 autoexec.cfg $pkgdir/opt/iortcw/Venom\ Mod/autoexec.cfg
}

md5sums=('0c2e76b606600ba58db634930dcbf137')
