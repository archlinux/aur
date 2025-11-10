# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=tracker-bin
_pkgname="${pkgname%-bin}"
pkgver=0.1.15
pkgrel=1
pkgdesc="A terminal-based real-time satellite tracking and orbit prediction application"
arch=('x86_64')
url="https://github.com/ShenMian/tracker"
license=('Apache-2.0')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$_pkgname-$pkgver-$arch.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-$arch.tar.gz"
		"https://raw.githubusercontent.com/ShenMian/tracker/refs/heads/main/LICENSE"
        "https://raw.githubusercontent.com/ShenMian/tracker/refs/heads/main/README.md")
sha512sums=('c50c8e24be707e4e32d30e7af61ba3ca272385e9c241c4e320f4fc7b587425f52d442f1749221a349a6461529b34141b290aeb3cb1d66da0acfd5e2b5f8330a0'
            'dc6b68d13b8cf959644b935f1192b02c71aa7a5cf653bd43b4480fa89eec8d4d3f16a2278ec8c3b40ab1fdb233b3173a78fd83590d6f739e0c9e8ff56c282557'
            '1efe1e42e5772d19724e941a684eddcf8014577a47748a803900be7ce0cf7f74254b94b0dbabdc747689cef4d40088a557cd7f0ce9536cec3d0cf0be84ff86d4')

package() {
  install -Dm0755 $srcdir/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}

