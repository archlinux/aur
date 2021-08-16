# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: Dominik Braun <mail at dominikbraun dot io>

pkgname=timetrace-bin
_srcname=timetrace
pkgver=0.13.0
pkgrel=1
pkgdesc="A simple CLI for tracking your working time."
arch=("x86_64")
url="https://github.com/dominikbraun/timetrace"
license=("Apache")
depends=('glibc')
optdepends=('bash-completion')
provides=('timetrace')
conflicts=('timetrace')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/timetrace-linux-amd64.tar.gz"
        "README-$pkgver.md::https://raw.githubusercontent.com/dominikbraun/timetrace/v$pkgver/README.md"
        "timetrace-bash-completion-$pkgver.sh::https://raw.githubusercontent.com/dominikbraun/timetrace/v$pkgver/completion/bash/timetrace.sh")
sha256sums=('79e8bfe9e97492ccddf23c3d811cefea8e51785aa07361ea4d4b754e3e756c39'
            '5ed48e7254450c9611e8f1604b7b4756b1f4297e4baea8d28e9833b8617dffd1'
            'a119663e3847a8dfa7523557df54222db9ad8b7df76c311079bba2fcb0018711')

package() {
	install -Dm 755 timetrace -t "$pkgdir/usr/bin/"
	install -Dm 644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 644 "timetrace-bash-completion-$pkgver.sh" "$pkgdir/usr/share/bash-completion/completions/timetrace"
}
