# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=tracker-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.2
pkgrel=1
pkgdesc="A terminal-based real-time satellite tracking and orbit prediction application"
arch=('x86_64')
url="https://github.com/ShenMian/tracker"
license=('Apache-2.0')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$_pkgname-$pkgver-$arch.tar.zst::$url/releases/download/v$pkgver/$_pkgname-linux-$arch.tar.zst"
		"https://raw.githubusercontent.com/ShenMian/tracker/refs/heads/main/LICENSE"
        "https://raw.githubusercontent.com/ShenMian/tracker/refs/heads/main/README.md")
sha512sums=('52e1a0d72f83e91646ffae5d6fee43458172c5f91b173f69336944bcb651bfce19191be8569a5f2f250e5c70080f08b8682d00649b7cf215c2c79f80166f30a2'
            'dc6b68d13b8cf959644b935f1192b02c71aa7a5cf653bd43b4480fa89eec8d4d3f16a2278ec8c3b40ab1fdb233b3173a78fd83590d6f739e0c9e8ff56c282557'
            '1efe1e42e5772d19724e941a684eddcf8014577a47748a803900be7ce0cf7f74254b94b0dbabdc747689cef4d40088a557cd7f0ce9536cec3d0cf0be84ff86d4')

package() {
  install -Dm0755 $srcdir/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}

