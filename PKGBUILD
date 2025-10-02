# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=stigmerge-bin
_pkgname="${pkgname%-bin}"
pkgver=v0.5.13
pkgrel=1
pkgdesc="Stigmergic merging of files over Veilid. Killab33z on the swarm."
arch=('x86_64' 'aarch64')
url="https://github.com/cmars/stigmerge"
license=('MPL-2.0')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source_x86_64=("$url/releases/download/$_pkgname-$pkgver/$_pkgname-$arch-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('fd18a5d257aeb69e97bfc89ee74da39f6d5d32aedc51f5f0ebd783b70a187886af2910d94e2fe4e32338a9241aaedb898e087882cbe39ee7cb786a03b0a36f7d')
source_aarch64=("$url/releases/download/$_pkgname-$pkgver/$_pkgname-$arch-unknown-linux-gnu.tar.gz")
sha512sums_aarch64=('20167a9853853d9d1732ce18aee520de56cbf0cc8624a981cc57cfcf53ecb8d805806c2e2f046d1c2af30c23097c7f4a83b8b2ad4cb64c83a5f0abca39b04976')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin"				"$srcdir/$_pkgname-$arch-unknown-linux-gnu/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname"	"$_pkgname-$arch-unknown-linux-gnu/LICENSE"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname"		"$_pkgname-$arch-unknown-linux-gnu/README.md"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname"		"$_pkgname-$arch-unknown-linux-gnu/CHANGELOG.md"
}

