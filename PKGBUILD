# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Constantin Lorenz <Cons27773964@aol.com>

_tbver=7.5a10
pkgname=sandboxed-tor-browser
pkgver=0.0.16
pkgrel=1
pkgdesc="A sandboxed version of the Tor Browser"
arch=(x86_64)
url=https://trac.torproject.org/projects/tor/wiki/doc/TorBrowser/Sandbox/Linux
license=(AGPL3)
depends=(bubblewrap gtk3 gnome-themes-standard)
makedepends=(make gcc libnotify)
optdepends=(libnotify)
conflicts=($pkgname-git)
source=($pkgname.desktop
        $pkgname.png)
source_x86_64=(https://dist.torproject.org/torbrowser/$_tbver/sandbox-$pkgver-linux64.zip{,.asc})
sha512sums=(2e1e653fb3c7df2c174c33f8f99a920eae0befae0889098450c6d7f883ad9e478e3748863486396b97665bb236fc834413c1683765a51d10af0a158da348e84c
            0a68a0a8cfeea630a91036d86b167cf640ab378e64e0d8ab55e9f99cde3c9d6a2d762ea0f5528f8a8e1579600fcc59eaa72ba499d95daeb4334e81ab644bfb02)
sha512sums_x86_64=(99f1a8e3fb01b7b324819d77e8ac2bd33f7a6de80dae13cac0bb849b179dfa506c09334e694e14754f82e969e40a04eea002adcb9f94220c46cb23c698eb16a2
                   SKIP)
validpgpkeys=(EF6E286DDA85EA2A4BA7DE684E2C6E8793298290)

package() {
  cd $srcdir

  install -Dm 644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm 644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm 755 $srcdir/sandbox/$pkgname $pkgdir/usr/bin/$pkgname
}
