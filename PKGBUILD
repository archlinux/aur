# Maintainer: nninkovic95
# Contributor: Angel Talero <angelgotalero@outlook.com>
#
# Release package for this fork, published to the AUR by
# .github/workflows/release.yml when a v<version> tag is pushed. pkgver and
# sha256sums below are placeholders: the workflow sets pkgver from the tag and
# fills in the checksum of the tag tarball. The -git package is ../PKGBUILD.
pkgname=qsgreeter-hyprland
pkgver=1.0.1
pkgrel=1
pkgdesc='QuickShell greeter for greetd, with a Hyprland session config'
arch=('any')
url='https://github.com/nninkovic95/greetd-qsgreeter'
license=('MIT')
depends=('greetd' 'quickshell' 'glib2' 'accountsservice')
optdepends=('hyprland: recommended wayland compositor')
provides=('qsgreeter')
conflicts=('qsgreeter' 'qsgreeter-git')
backup=('etc/xdg/quickshell/qsgreeter/colorscheme.json'
        'etc/xdg/quickshell/qsgreeter/style.json'
        'etc/greetd/qsgreeter-hyprland.lua')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bc83aa2f47c87109f2aeebadbabf3f1f41c4268f783729e2bbfd10cd3139d3b3')

package() {
	cd "greetd-qsgreeter-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
