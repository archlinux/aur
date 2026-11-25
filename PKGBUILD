# Maintainer: tee < teeaur at duck dot com >
pkgname=pragtical-bin
pkgver=3.16.0
pkgrel=1
pkgdesc="The practical and pragmatic code editor"
arch=(x86_64)
url="https://pragtical.dev"
license=(MIT)
provides=(pragtical)
conflicts=(pragtical)
depends=(glibc hicolor-icon-theme libgcc libstdc++)
_src="https://github.com/pragtical/pragtical"
source=("$_src/releases/download/v$pkgver/pragtical-v$pkgver-linux-x86_64-portable.tar.gz"
  "$_src/raw/v$pkgver/resources/linux/dev.pragtical.Pragtical.desktop"
  "$_src/raw/v$pkgver/resources/icons/logo.svg")
b2sums=('be4fa4c4f8ae51a6a247ea3e0c7e43c958793cbbe70ce8ff913fb517546de94621e8d9a64acde108618da1e21255c19a791faa1fda0311f4c216974c021c975a'
        'c5256e04a2999354e525d725b4d20c1df870468ecfc72769936c47b8f8608ead903a8658fab84e8604faf65b5a8d8986d8b43aaf830e22e8f338be7eff918839'
        '4bf03e24e31e0d7958cd50a54503c92792e76c6f7e40d4c8db744d708aa8b6e1df40fbf4a52a897be55c274b74178b3204a79d44c755073149fe24466b209886')

package() {
  cd "$pkgdir"
  install -dm755 opt usr/bin
  cp -r --no-preserve=ownership "$srcdir/pragtical" opt
  ln -sf /opt/pragtical/pragtical -t usr/bin/
#  install -Dm644 "$srcdir"/pragtical/doc/licenses.md -t "usr/share/licenses/pragtical/"
  install -Dm644 "$srcdir"/dev.pragtical.Pragtical.desktop -t "usr/share/applications/"
  install -Dm644 "$srcdir"/logo.svg "usr/share/icons/hicolor/scalable/apps/pragtical.svg"
}
