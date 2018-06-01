# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Constantin Lorenz <Cons27773964@aol.com>

_tbver=8.0a7
pkgname=sandboxed-tor-browser
pkgver=0.0.16
pkgrel=4
pkgdesc='A sandboxed version of the Tor Browser (bin)'
arch=(x86_64)
url=https://trac.torproject.org/projects/tor/wiki/doc/TorBrowser/Sandbox/Linux
license=(AGPL3)
depends=(bubblewrap gtk3)
optdepends=(pulseaudio gnome-themes-standard libnotify)
conflicts=($pkgname-git)
source=($pkgname.desktop
        $pkgname.png
        https://dist.torproject.org/torbrowser/$_tbver/sandbox-$pkgver-linux64.zip{,.asc})
sha512sums=(2e1e653fb3c7df2c174c33f8f99a920eae0befae0889098450c6d7f883ad9e478e3748863486396b97665bb236fc834413c1683765a51d10af0a158da348e84c
            0a68a0a8cfeea630a91036d86b167cf640ab378e64e0d8ab55e9f99cde3c9d6a2d762ea0f5528f8a8e1579600fcc59eaa72ba499d95daeb4334e81ab644bfb02
            04d7f1766c916e2b9dbeeb8435453bb34db37309d714f2ca616443ec0abcbb5ec0f8a2a3b7d6febabfbd4bc42889cb3f3fbbfa74935a501d87fe14f6b66ad201
            SKIP)
validpgpkeys=(EF6E286DDA85EA2A4BA7DE684E2C6E8793298290)

package() {
  cd $srcdir
  install -Dm 644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm 644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm 755 $srcdir/sandbox/$pkgname $pkgdir/usr/bin/$pkgname
}
